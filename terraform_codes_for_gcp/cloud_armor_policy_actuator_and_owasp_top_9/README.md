
# 
# This folder has the code that deploys cloud armor security policy that blocks actuators and traffoc that matches OWASP top 9
#


## Tested successfuly
#


###  File is this folder and their purposes
     provider.tf ==> info to login to GCP (has to be modified before you can use this code set)
     cloud_armor_policy_for_stage_actuator_and_owasp.tf ==> real beef of this code set. deploys a cloud armor security policy with top 9 OWASP rules
