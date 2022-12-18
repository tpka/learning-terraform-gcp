# lecture 45-48:

# google_cloud_run_service: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service

# See link below for argument reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service

# lecture 45:
resource "google_cloud_run_service" "run-app-from-tf" {
    name = "run-app-from-tf"
    location = "asia-southeast1"
    template {
      spec {
        containers {
# https://console.cloud.google.com/gcr/images/google-samples/global/hello-app
            image = "gcr.io/google-samples/hello-app:1.0"
        }
      }
    }
}
