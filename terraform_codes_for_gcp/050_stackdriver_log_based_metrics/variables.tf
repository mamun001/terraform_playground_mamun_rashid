locals {
  project = "foobar"     #  GCP project name
  credentials_file = "foobar.json"   # File that has your JSON credentials to logon to GCP
  region = "us-central1"
  zone = "us-central1-b"
  cluster = "foobar-cluster"    # Kubernetes Cluster
  namespace = "integration"
  resource_type = "k8s_container"
  app = "foobar-microservice"    # microservice on Kubernetes
  env_prefix = "test_"    #names of logging metric start with this. in is us prod, it should be us_
}
