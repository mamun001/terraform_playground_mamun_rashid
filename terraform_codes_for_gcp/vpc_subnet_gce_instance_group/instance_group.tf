
resource "google_compute_instance_group" "foobar_instance_group" {
    name = local.instance_group_name
    project = local.project 
    zone = local.zone 
    #instances = [local.instance_name]
    instances = ["${google_compute_instance.backend_vm_1.self_link}"]
    named_port {
        name = "http"
        port = "8080"
    }
    }
    
    
