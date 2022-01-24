
This template will call a mdoule, which (for a given list of service accounts): will create:
  a. a service account on the given project
  b. will add role policy (a list of pairs): to this service account: ROLE --> PROJECT B,C (if provided) (please see below an example)
  c. a permission key for the service account
  d. a kubernetes secret from that key.

 Example Input to this module:

 Explanation:

 For each SERVICE ACCOUNT:
          You will have:
           1. display name
           2. key-value pairs of project-role (a role to be given to this SA in that project)

          X N Service Accounts (as a list of maps)

{
  "inputs": [
        {
          "acct_id": "sa-mamun-terraform-19",
          "display_name": "john doe",
          "project-role-pairs": {"test-7-481ef3d2": "roles/logging.logWriter", "test-7-481ef3d2": "roles/storage.objectViewer"}
        },
        {
          "acct_id": "sa-ms-united3-dms3",
          "display_name": "sa-ms-united3-dms3",
          "project-role-pairs": {"test-7-481ef3d2": "roles/logging.logWriter", "sre-sandbox-243618": "roles/storage.objectViewer"}
        }
      ]
}


