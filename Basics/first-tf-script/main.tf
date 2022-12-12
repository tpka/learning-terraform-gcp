# Lecture-8:
# https://registry.terraform.io/providers/hashicorp/local/2.2.3



resource "local_file" "sample_res" {
    filename = "sample.txt"
    content = "I love Terraform"
  
}

