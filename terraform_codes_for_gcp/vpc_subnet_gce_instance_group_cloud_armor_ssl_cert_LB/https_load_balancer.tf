module "foobar-https-lb" {
    source = "GoogleCloudPlatform/lb-http/google"
    version = "~> 6.1"
    name = local.https-lb 
    project = local.project 
    firewall_networks = [local.firewall_network]
    create_url_map = false 
    url_map = google_compute_url_map.foobar.self_link
    use_ssl_certificates = true 
    ssl = true 
    random_certificate_suffix = true 
    https_redirect = true 
    ssl_certificates = [google_compute_managed_ssl_certificate.foobar.self_link]
    backends = {
        default = {
            description = "Default Backend for this LB"
            protocol = "HTTP"
            port = 80
            port_name = "http"
            timeout_sec = 600
            connection_draining_timeout_sec = null 
            enable_cdn = false 
            # This is link to POLICY in CLOUD ARMOR
            security_policy = google_compute_security_policy.cloud_armor_security_policy_1.id 
            session_affinity = null 
            affinity_cookie_ttl_sec = null 
            custom_request_headers = null 
            custom_response_headers = ["X-Cache-Hit: {cdn_cache_status}"]
            health_check = {
                check_interval_sec = 120
                timeout_sec = 120
                healthy_threshold = 2
                unhealthy_threshold = 2
                request_path = "/"
                port = 80
                host = null
                logging = false
            }
            log_config = {
                enable = true 
                sample_rate = null 
            }
            # instance_group backend
            groups = [
                {
                  group = google_compute_instance_group.foobar.id
                  balancing_mode = "UTILIZATION"
                  capacity_scaler = null 
                  description = null 
                  max_connections = null 
                  max_connections_per_instance = null 
                  max_connections_per_endpoint = null
                  max_rate = 10
                  max_rate_per_instance = null 
                  max_rate_per_endpoint = null 
                  max_utilization = 0.0
                }
            ]
            iap_config = {
                enable = false
                #oauth2_client_id = local.google-iap-client-id
                oauth2_client_id = null
                #oauth2_client_secret = local.google-iap-client-secret 
                oauth2_client_secret = null
            }
        }
    }
}
