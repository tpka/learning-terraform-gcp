# tf-workspace

Learning history and files of *Terraform for Beginners using GCP - Google Cloud (Hands-on)* from Udemy
- https://www.udemy.com/course/terraform-for-beginners-using-google-cloud/
- https://github.com/ankit25587/course-material/tree/main/05-terraform-for-beginners-using-google-cloud

---

# Work notes
- Below is just work note of my learning ;)

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
- [File: first-tf-script](./Basics/first-tf-script)

### 9: local_file arguments
- Doc: https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

### 10: Mutltiple Resources
- Multiple resource in one main.tf
- [File: multiple-resources](./Basics/multiple-resources)

### 11: Random provider
- Doc: https://registry.terraform.io/providers/hashicorp/random/latest/docs
- [File: random-provider](./Basics/random-provider)

### 12: Intro to Variables
- to use variable instead of hardcorded value
- [File: variables](./Basics/variables)

### 13: List of Variables 1
- [File: types_of_variables](./Basics/types_of_variables)
```
string – “cat”
number – 234, 6.5
bool - true/false
list – sequence of value
    list(string) =>[“red”, “green”, “blue”]
Tuple – group non homogeneous data type
    tuple([string, number, bool]) => [“dog”, 23, true]
map – like key value : Dictionary
    {name = “Ankit", age = 32}
set – only unique values
object – complex data type
```

### 15: Using Variables
- There are 4 ways to use variable as below
```
variable filename {
    type = string
    default = "sample.txt"
}
var.filename

---
variable filename {}    Terraform apply will ask

---
terraform apply -var "filename=sample.txt"

---
export TF_VAR_filename=sample.txt"
```
- The order of loading variable. 1 is higher priority = load first
```
1. export TF_VAR_filename=sample.txt“
2. terraform.tfvars file
3. variable.auto.tfvars file
4. terraform apply -var "filename=sample.txt”
```

### 16: Multiple Providers
- [File: multiple-providers](./Basics/multiple-providers)

### 17: Dependency
- [File: Implicit dependency](./Basics/dependency-implicit/)
- [File: Explicit dependency](./Basics/dependency-explicit/)
- Reference:
    - [Understanding Terraform's depends_on](https://technotrampoline.com/articles/how-does-terraform-depends-on-work/)

### 18: Output Block
- [File: Output Block](./Basics/output-block/)

### 19: Lifecycle Rules
- [File: Lifecycle Rules](./Basics/lifecycle/)
- lifecycle – resource attributes
- <u>create_before_destroy</u> - Create the resource first and then destroy older
- <u>prevent_destroy</u> - Prevents destroy of a resource
- <u>ignore_changes</u> - Ignore Changes to Resource – Specific tag or all

### 20: Provisioner Version
- [File: Provisioner Version](./Basics/provider_version/)
- Doc: https://registry.terraform.io/providers/hashicorp/random/latest/docs
    - to check current latest version

### 21: Data Source - Read File
- [File: Data Source](./Basics/data_source/)
## Section4: Terraform with Google Cloud

### 23: Project - Service Account
- Service Account
    - https://console.cloud.google.com/iam-admin/serviceaccounts
    - created new service account
        > terraform-gcp

### 24: Provider & version
- GCP provider Doc: https://registry.terraform.io/providers/hashicorp/google/latest/docs
- [File: Google Provider](./GCP/get-started-with-gcp/)

### 25-27: Connect Terraform with GCP
- Google Provider base configuration
    - projectid, zone, region
- Multiple way to authernticate with GCP
    - <u>username/password</u> - gcloud auth application - default login
    - <u>Cloud Shell</u>(lecture 26)
    - <u>Service Account</u> - Keys: preferred in production(lecture 27)
- Doc: [google_storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)
- [File-26:](./GCP/get-started-with-gcp/)
- [File-27:](./GCP/get-started-with-gcp-auth-service-account/)

### 29-32: Cloud Storage
- Doc: https://cloud.google.com/storage
- Doc: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
- [File-30-32:](./GCP/GCS/)

### 33-34: VPC
- 3 Types of VPC
    - Default VPC
    - Auto Mode
    - Custom Mode
- [File-34-36:](./GCP/network/)

### 38-43: Compute Engine
- [File-38-42:](./GCP/GCE)
- Doc:
    - [google_compute_instance:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)
    - [google_compute_disk:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk)
    - [google_compute_attached_disk:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_attached_disk)

### 45-48: Cloud Run
- [Container Registory, Google Samples](https://console.cloud.google.com/gcr/images/google-samples)
- [File-45-47](./GCP/Run/)

### 49-53: Cloud Function
- [File-50-53](./GCP/Function/)
- Doc:
    - [google_cloudfunctions_function:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function)
    - [google_cloudfunctions2_function:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function)

### 54: BigQuery
- [File-54](./GCP/BigQuery/)
- Doc:
    - [google_bigquery_dataset:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset)
    - [google_bigquery_table:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table)

### 55-56: Cloud PubSub
- [File-56](./GCP/PubSub/)
- Doc:
    - [google_pubsub_topic:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic)
    - [google_pubsub_subscription:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription)

### 57: Cloud Spanner
- [File-57](./GCP/Spanner/)
- Doc:
    - [google_spanner_instance:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance)
    - [google_spanner_database:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_database)

### 58-59: Cloud SQL
- [File-59](./GCP/SQL/)
- Doc:
    - [google_sql_database_instance:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)
    - [google_sql_database:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database)


### 61-62: [BigTable](https://cloud.google.com/bigtable/docs/)
- a fully managed, wide-column NoSQL database
- [File-61-62](./GCP/BigTable/)
- Doc:
    - [google_bigtable_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance)
    - [google_bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table)


### 63-63: [Memoeystore](https://cloud.google.com/memorystore/docs)
- in-memory data store service for Redis and Memcached

- [File-61-62](./GCP/Redis/)
- Doc:
    - [google_redis_instance(resources):](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance)
    - [google_redis_instance(data resources):](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/redis_instance)
    - [google_memcache_instance:](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memcache_instance)

---

## Environment:
- tf is installed on tfenv 
```
% tfenv list
* 1.3.0 (set by /usr/local/Cellar/tfenv/3.0.0/version)
  1.0.10
% terraform --version
Terraform v1.3.0
```