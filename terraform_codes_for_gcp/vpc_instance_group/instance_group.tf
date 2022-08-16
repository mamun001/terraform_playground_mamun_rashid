
resource "google_compute_instance_group" "foobar_instance_group" {
    name = local.instance_group_name
    project = local.project 
    zone = local.zone 
    #instances = local.instances 
    named_port {
        name = "http"
        port = "8080"
    }
    }
    
    
