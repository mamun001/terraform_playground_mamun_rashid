

## DEPLOY ALL YOU NEED TO DEPLOY A KUBERNETES APP      


### All tested and works beautifully


### Example Use Case:
####  When you wan to deploy a containered app on Kubernetes Cluster of your own.

### Steps: Order in which the resources should be created
              TODO: add depends_on so that they are executed in sequence
####  1. VPC
####  2. Subnet
####  3. k8s cluster
####  4. public IP
####  5. k8s app service and deployment


### WHAT IS NOT INCLUDED:
       provider.tf

### Once deployed , you go to http://public_ip_of_loadbalancer:80 and boom ! You see the web page


