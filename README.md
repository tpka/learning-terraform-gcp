# tf-workspace

Learning history and files of *Terraform for Beginners using GCP - Google Cloud (Hands-on)* from Udemy
- https://www.udemy.com/course/terraform-for-beginners-using-google-cloud/
- https://github.com/ankit25587/course-material/tree/main/05-terraform-for-beginners-using-google-cloud

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
    > /Volumes/GoogleDrive/My Drive/lab/udemy_Terraform-GCP/first-tf-script

### 8: init, plan, apply
- files:
    - /Volumes/GoogleDrive/My Drive/lab/udemy_Terraform-GCP/first-tf-script

### 9: local_file arguments


## Section4: Terraform with Google Cloud

## 23:
- Service Account
    - https://console.cloud.google.com/iam-admin/serviceaccounts
    - created new service account
        > terraform-gcp

## 24: Provider & version
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