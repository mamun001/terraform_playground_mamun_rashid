

#   Using attribute of one resource to create another resource

###  In this code, we first create a  service_account in GCP project
###  In GCP Console, the name will be foobar1234567
###  In here, Terraform will know it as google_service_account.foobar_service_account
###  One of it's atrributes is: email
#


### Then we create another resource called iam_member 
### google_service_account has an attribute called "email"
### We use that to create another resource iam_member
### We give the Service Account logWriter Role


