# Lecture-9:
# https://registry.terraform.io/providers/hashicorp/local/2.2.3
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file#sensitive_content

# using "sensitive_content" instead of "content"
# This will not display in terraform plan/apply

# adding file_permission argument

resource "local_file" "sample_res" {
    filename = "sample_arg.txt"
#    content = "I love Terraform"
    sensitive_content = "I love Terraform"
    file_permission = "0700"
}