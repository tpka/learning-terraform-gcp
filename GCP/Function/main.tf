# lecture 50-53:

# google_cloudfunctions_function: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function
# google_cloudfunctions2_function: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function

# Steps 
## 1. Creating Bucker
## 2. Upload index.zip
## 3. Deploying Function
## 4. Binding policy

## lecture50-1. Creating Bucker
# google_storage_bucket: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "fun_bucket" {
    name = "fun_bucket-tf-20221221"
    location = "ASIA-SOUTHEAST1"
}

## lecture50-2. Upload index.zip
resource "google_storage_bucket_object" "srccode" {
    name = "index.zip"
    bucket = google_storage_bucket.fun_bucket.name
    source = "index.zip"
}

## lecture51-3. Deploying Function
# google_cloudfunctions_function: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function
resource "google_cloudfunctions_function" "fun-from-tf" {
    name = "fun-from-tf"
    runtime = "nodejs14"
    description = "This is my first function from terraform script"

    available_memory_mb = 128
    source_archive_bucket = google_storage_bucket.fun_bucket.name
    source_archive_object = google_storage_bucket_object.srccode.name

    trigger_http = true
    entry_point = "helloWorldtf"
}

## lecture52-4. Binding policy
# IAM policy for Cloud Functions CloudFunction: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function_iam
resource "google_cloudfunctions_function_iam_member" "allowaccess" {
    region = google_cloudfunctions_function.fun-from-tf.region
    cloud_function = google_cloudfunctions_function.fun-from-tf.name
    role = "roles/cloudfunctions.invoker"
    member =  "allUsers"
}