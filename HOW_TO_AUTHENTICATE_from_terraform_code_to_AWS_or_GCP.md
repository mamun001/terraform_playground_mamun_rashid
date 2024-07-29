

# How to authenticate to AWS or GCP from Terraform Code

  ## For AWS: 
    ### Each folder will have a .tf file which will NOT be committed to code. That file will have creds to auth to AWS
    ###
    ### You can also use the following shell variables:
    ####  export AWS_ACCESS_KEY_ID="anaccesskey"
    ####  export AWS_SECRET_ACCESS_KEY="asecretkey"
    ####  export AWS_REGION="us-west-2" 

  ## For GCP: 
    ### local machine will have the following it its bash profile. That will link to GCP project.
           export GOOGLE_APPLICATION_CREDENTIALS={{path}}

    ### OR, have provider.tf file like the following

#### provider "google" {
####   credentials = file("./foo.json")
####   project     = "project-id"
#### region      = "us-central1-a"
#### }







