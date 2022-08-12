locals {
  #project = "sre-sandbox-243618"
  project = "foobarles-rehersal"
  #credentials_file = "/Users/mamun001/sandbox_access.json"
  credentials_file = "/Users/mamun001/foobarles-rehersal-d786f83893f5.json"
  region = "us-central1"
  zone = "us-central1-b"
  cluster = "cluster-bandpractice"
  namespace = "integration"
  resource_type = "k8s_container"
  app = "ms-websocket-streaming"
  env_prefix = "test_"    #names of logging metric start with this. in is us prod, it should be us_
}
