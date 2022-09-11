
## Code Set of Creating a Cloud Armor Policy with OWASP Rules and All That It Depends On
###       (and some nice haves to completeness)
#

#


### This code set creates:
###  (In order of dependecies)
##### VPC
##### Subnet
##### GCE Instance
##### Instance Group
##### Healthcheck
##### backend_service
##### URL MAP
##### Managed SSL Certificate 
##### HTTP Load Balancer
##### cloud_armor_security_policy with OWASP Rules
#


### Code modified from:
###   https://brk0018.medium.com/implement-cloud-armor-security-policy-s-using-terraform-1794792e2842
      and:
      https://gmusumeci.medium.com/getting-started-with-terraform-and-google-cloud-platform-gcp-deploying-vms-in-a-private-only-f9ab61fa7d15
###   (great code for HTTPS LB and more)
#


#### 1. for this code to run you have to set: 
####     export GOOGLE_APPLICATION_CREDENTIALS="/some_folder/some_json_file.json"  
####       where the your service account's json creds are kept
#


#### Some notes
##### LB needs url_map
##### url_map needs backend_service
##### backend_service needs health_check


