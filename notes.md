## Work notes
- This is just work note of learning ;)

---
## Section3: Terraform Basics & Installation
### 7: TF workflow
1. scope
2. author
3. initialize
4. plan
5. apply

- VSCode extension
    - install it
- Local provider
    > https://registry.terraform.io/providers/hashicorp/local/2.2.3

### 8: init, plan, apply
- file:
    - /Users/t.takatsuka/Documents/learning-terraform-gcp/first-tf-script

### 9: local_file arguments
- Doc: https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

### 10: Mutltiple Resources
- Multiple resource in one main.tf
- file:
    - /Users/t.takatsuka/Documents/learning-terraform-gcp/multiple-resources

### 11: Random provider
- Doc: https://registry.terraform.io/providers/hashicorp/random/latest/docs



## Section4: Terraform with Google Cloud

### 23:
- Service Account
    - https://console.cloud.google.com/iam-admin/serviceaccounts
    - created new service account
        > terraform-gcp

### 24: Provider & version
- GCP provider Doc: https://registry.terraform.io/providers/hashicorp/google/latest/docs


---

## Environment:
- tf is installed on tfenv 
```
t.takatsuka@FVFD90FLP3YV first-tf-script % tfenv list
* 1.3.0 (set by /usr/local/Cellar/tfenv/3.0.0/version)
  1.0.10
  0.14.4
t.takatsuka@FVFD90FLP3YV first-tf-script % terraform --version
Terraform v1.3.0
on darwin_amd64

Your version of Terraform is out of date! The latest version
is 1.3.4. You can update by downloading from https://www.terraform.io/downloads.html
```