
resource "google_compute_instance_group" "foobar_instance_group" {
    name = local.instance_group_name
    project = local.project 
    zone = local.zone 
    description = "Terraform test instance group"
    instances = [
      google_compute_instance.foobar_gce_1.id,
      google_compute_instance.foobar_gce_2.id,
    ]
    named_port {
        name = "http"
        port = "8080"
    }
}
    

