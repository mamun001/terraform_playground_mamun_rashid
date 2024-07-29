
### CREDIT
###  This code is coped from https://medium.com/codex/kubernetes-and-terraform-in-google-cloud-3fc9e1c81e0

### That set of codes of worked so beautifully, there was no need to edit anything
#

#
# explanation is provided here
#   https://stackoverflow.com/questions/64134253/how-to-get-default-gcp-project-and-region-with-terraform
#  get what is the provider's default project and region? Something analogous to aws_region in AWS (like in this question), but for Google Compute Engine (GCE/GCP)
data "google_client_config" "provider" {}


#  These set grabs bunch of information we need FROM the cluster to build our k8s SERVICE and k8s Deployment
provider "kubernetes" {
  version = "1.10.0"
  host    = google_container_cluster.gke_cluster.endpoint
  token   = data.google_client_config.provider.access_token
  client_certificate = base64decode(
    google_container_cluster.gke_cluster.master_auth[0].client_certificate,
  )
  cluster_ca_certificate = base64decode(
    google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate,
  )
  client_key = base64decode(google_container_cluster.gke_cluster.master_auth[0].client_key)
}


#  ____________ k8s SERVICE _____________________
#
#  Note that to build this SERVICE , the only dependency is the IP of the LB. That's it
#
# This uses the Kubernetes provider!
resource "kubernetes_service" "app" {
  metadata {
    name = "app"
  }

  spec {
    selector = {
      run = "app"
    }

    session_affinity = "None"

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
    load_balancer_ip = google_compute_address.public_lb_ip.address
  }
}


#  __________________ k8s deployment _________________________
# This uses the Kubernetes provider!
# USE THIS images to create the deployment "escoto/kotlinresthello"
resource "kubernetes_deployment" "app" {
  metadata {
    name = "app"

    labels = {
      run = "app"
    }
  }

  spec {
    replicas = 1

    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = 1
        max_unavailable = 0
      }
    }

    selector {
      match_labels = {
        run = "app"
      }
    }

    template {
      metadata {
        name = "app"
        labels = {
          run = "app"
        }
      }

      spec {
        container {
          image = "escoto/kotlinresthello"
          name  = "app"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}
