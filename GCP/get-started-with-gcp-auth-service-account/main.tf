# lecture: 24, 25
# Basic use of provider
# https://registry.terraform.io/providers/hashicorp/google/latest/docs

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.45.0"
    }
  }
}


# see cmd2.log
# default project for google provider, region and zone defined in block below
provider "google" {
  project = "YOUR-PROJ"
# https://cloud.google.com/compute/docs/regions-zones
  region = "asia-northeast1"
  zone = "asia-northeast1-a"
# credentials is created in GCP console, IAM & Admin > Service Account
  credentials = "../key-service-account.json"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource google_storage_bucket "GCS1" {
  name = "bucket-from-using-sa-20221212"
# https://cloud.google.com/storage/docs/locations
  location = "ASIA-NORTHEAST1"
}