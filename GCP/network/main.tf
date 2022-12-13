# lecture 34-36:

# google_compute_network: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
# google_compute_subnetwork: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
# google_compute_firewall: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall


# See link below for argument reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network#argument-reference
resource "google_compute_network" "auto-vpc-tf" {
    name = "auto-vpc-tf"
    auto_create_subnetworks = true 
}

resource "google_compute_network" "custom-vpc-tf" {
    name = "custom-vpc-tf"
    auto_create_subnetworks = false 
}


# lecture 35:
# to create subnet in custom vpc
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork#argument-reference
resource "google_compute_subnetwork" "sub-sg" {
    name = "sub-sg"
    network = google_compute_network.custom-vpc-tf.id
    ip_cidr_range = "10.1.0.0/24"
# region: https://cloud.google.com/compute/docs/regions-zones
    region = "asia-southeast1"
# applying private google access on
    private_ip_google_access = true
}

# lecture 36:
# to create firewall rules
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall#argument-reference
resource "google_compute_firewall" "allow-icmp" {
    name = "allow-icmp"
    network = google_compute_network.custom-vpc-tf.id
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall#nested_allow
    allow {
      protocol = "icmp"
    }
# IP is from my laptop, search from "what is my IP"
    source_ranges = ["210.80.199.132/32"]
    priority = 455
}


# to create allow http
resource "google_compute_firewall" "allow-http" {
    name = "allow-http"
    network = google_compute_network.custom-vpc-tf.id
    allow {
      protocol = "tcp"
      ports = ["80"]
    }
    source_ranges = ["0.0.0.0/0"]
}



# Block to display output when terraform apply
output "auto" {
    value = google_compute_network.auto-vpc-tf.id
}

output "custom" {
    value = google_compute_network.custom-vpc-tf.id 
}
