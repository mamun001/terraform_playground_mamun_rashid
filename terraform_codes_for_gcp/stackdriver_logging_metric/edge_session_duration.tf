resource "google_logging_metric" "edge_session_duration" {
  bucket_options {
        exponential_buckets {
            growth_factor      = 2
            num_finite_buckets = 64
            scale              = 0.01
        }
  }
  filter           = <<-EOT
        resource.type="${local.resource_type}"
        resource.labels.project_id="${local.project}"
        resource.labels.location="${local.zone}"
        resource.labels.cluster_name="${local.cluster}"
        resource.labels.namespace_name="${local.namespace}"
        labels.k8s-pod/app="${local.app}"
        labels.k8s-pod/cluster="${local.app}"
        "edge metric"
    EOT
  label_extractors = {
        "channel_id"    = "EXTRACT(jsonPayload.data.channel)"
        "gateway_id"    = "EXTRACT(jsonPayload.data.gateway)"
        "location_type" = "EXTRACT(jsonPayload.data.locationType)"
        "org_id"        = "EXTRACT(jsonPayload.data.orgId)"
  }
  metric_descriptor {
        metric_kind = "DELTA"
        value_type  = "DISTRIBUTION"
        labels {
            key        = "channel_id"
            value_type = "STRING"
        }
        labels {
            key        = "gateway_id"
            value_type = "STRING"
        }
        labels {
            key        = "location_type"
            value_type = "STRING"
        }
        labels {
            key        = "org_id"
            value_type = "STRING"
        }
    }
  #name               = "test_edge_session_duration"
  name             = "${local.env_prefix}edge_session_duration"
  project          = local.project
  value_extractor  = "EXTRACT(jsonPayload.data.sesssionDuration)"
  timeouts {}
}
