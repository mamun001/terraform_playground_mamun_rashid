

This modules create N bcukets.


Input parameters are passed as list of maps.
Each element is an attributes of a bucket.

  name          = bucket's name
  project       = project the bucket goes into
  storage_class = storage class of the bucket
  location      = location constraints

 Rest of the parameters would be GCP default.


Algorithm:

  Module then creates the bucket using the values as parameters for each bucket (using for each loop)

 Caveats:
   Retention parameters does not do what we think does. In fact, it can lock up the bucket forever. Hence, it is not used.
   Life Cycle parameters and CORS parameters have been left blank.
   Versioning is turned on by default.



## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| modinput\_buckets | The list of subnets being created | `list(map(string))` | n/a | yes |

## Outputs

No output.

