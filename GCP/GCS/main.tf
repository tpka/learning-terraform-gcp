# lecture 29-32:

# google_storage_bucket
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket


# See link below for argument reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket#argument-reference
resource "google_storage_bucket" "GCS1" {

    name = "udemy-tf-course-from-tf-20221212"
    location = "ASIA-NORTHEAST1"
#    storage_class = "STANDARD"

# lecture 30:
# add some arguments
    storage_class = "NEARLINE"
    labels = {
      "env" = "tf_test"
      "dept" = "compliance"
    }
    uniform_bucket_level_access = true

# lecture 31:
# add lifecycle rule
# https://cloud.google.com/storage/docs/lifecycle#configuration
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket#nested_lifecycle_rule
    lifecycle_rule {
        condition {
            age = 5
        }
        action {
            type = "SetStorageClass"
            storage_class = "COLDLINE"
        }
    }

# lecture 32:
# to set retention policy
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket#retention_policy
    retention_policy {
        is_locked = true
        retention_period = 864000 # 10 days in seconds
    }
}




# lecture 31:
# to uplopad file
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object
resource "google_storage_bucket_object" "picture" {
    name = "gcp_logo"
    bucket = google_storage_bucket.GCS1.name
    source = "Google_Cloud_logo.svg"
    
  
}
