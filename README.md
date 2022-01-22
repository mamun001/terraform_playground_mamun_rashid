

# terraform_codes

A sample of Mamun Rashid's Terraform Codes

Each project has its own folder:
   e.g. create_ecs_cluster_and_service

Note: modules folder will be shared between environments.
   This is the set of the most re-usable codes

Authentication:

  For AWS: each folder will have a .tf file which will NOT be committed to code. That file will have creds to auth to AWS

  For GCP: local machine will have the following it its bash profile. That will link to GCP project.
           export GOOGLE_APPLICATION_CREDENTIALS={{path}}



