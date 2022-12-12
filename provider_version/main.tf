# lecture: 20

# added blocks below from link below to specify the version
# https://registry.terraform.io/providers/hashicorp/random/2.3.1/docs
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "2.3.1"
    }
  }
}

provider "random" {
  # Configuration options
}


# first block
resource "random_integer" "name" {
    min = 0
    max = 100
}




