
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.45.0"
    }
  }
}

# default project for google provider, region and zone defined in block below
provider "google" {
  project = "YOUR-PROJECT"
# https://cloud.google.com/compute/docs/regions-zones
  region = "asia-northeast1"
  zone = "asia-northeast1-a"
# credentials is created in GCP console, IAM & Admin > Service Account
  credentials = "../key-service-account.json"
}
