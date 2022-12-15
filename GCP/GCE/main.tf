# lecture 37-43:

# google_compute_instance: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
# google_compute_disk: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk
# google_compute_attached_disk: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_attached_disk

# See link below for argument reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#argument-reference
resource "google_compute_instance" "vm-from-tf" {
    name = "vm-from-tf"
    zone = "asia-southeast1-a"
# boot_disk: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#nested_boot_disk
# images: https://cloud.google.com/compute/docs/images/os-details
## Cloud SDK: gcloud compute images list
    boot_disk {
        initialize_params {
            image = "debian-10-buster-v20221206"
            size = 30
        }
# lecture 40:
# to not to delete boot disk when deleting vm
# default is true
        auto_delete = false # = Keep disk
    }
# machine_type: https://cloud.google.com/compute/docs/general-purpose-machines
    machine_type = "n1-standard-2"
# network_interface: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#nested_network_interface
    network_interface {
        network = "custom-vpc-tf"
        subnetwork = "sub-sg"
    }
# option below required TRUE when changing machine type that requires system stop
    allow_stopping_for_update = true  
# lecture 40:
# adding lables
    labels = {
      "dept" = "finance"
      "env" = "tf-learning"
    }
/*
# lecture 40:
# make a vm to Preemptible vm
    scheduling {
        preemptible = true
# option below required FALSE when vm is preemptible
        automatic_restart = false
    }
*/

# lecture 41:
# attaching service account to VM
# service_account: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance#nested_service_account
    service_account {
        email = "YOUR-SERICE-ACCOUNT-EMAIL-ADDRESS"
        scopes = ["cloud-platform"]
    }

# lecture 42:
# argument below is requirement when attaching the disk
    lifecycle {
        ignore_changes = [
            attached_disk
        ]
    }
}

# lecture 42
# This block will create a additional disk, but not attacning to VM yet
# google_compute_disk: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk#argument-reference
resource "google_compute_disk" "disk-1" {
    name = "disk-1"
    size = 15
    zone =  "asia-southeast1-a"
    type  = "pd-ssd"
}

# lecture 42:
# This block will attche the disk to the vm
# google_compute_attached_disk: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_attached_disk#argument-reference
resource "google_compute_attached_disk" "disk-1-attach" {
    disk = google_compute_disk.disk-1.id
    instance = google_compute_instance.vm-from-tf.id
}