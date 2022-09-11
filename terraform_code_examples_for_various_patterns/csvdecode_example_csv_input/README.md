

## CODE SET EXAMPLE & EXPLANATIONS of HOW to USE csvdecode to LOOP THROUGH a .csv FILE as INPUT
###   In this case, we are creating a GCE instance per each line in the .csv file.
#

#


### This codes creates 1 GCE Instance per each line in input.csv (minus the header)
### Each line in input.csv has the parameters needed to build 1 GCE instance
#


#### "local.instances" variable is defined variables.tf file
####  local.instances reads the input.csv file and converts each line in to MAP
#### Therefore, "instances" is a MAP.
#### in gce_loop.tf file, "instances" variable is used to loop through each item in the map to create ONE GCE instance per item of the map. 
#


### In gce_loop.tf file:
       In the for_each line below "inst" is like "i" in a for loop. "inst" can be replaced with any other word. It is arbitrary.
       However "name" in in inst.name has meaning
       You will see in input.csv file that the first value is named "name"
       So, we are looping through each MAP item via "name" attribute
         for_each = { for inst in local.instances : inst.name => inst }
       below "each" refers to current item in the map
       "value" has to be used as is required as it refers to the ACTUAL value of that parameters in the CURRENT reord of the map.
         name         = each.value.name

