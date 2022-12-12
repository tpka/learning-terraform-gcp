# Lecture-10:
# https://registry.terraform.io/providers/hashicorp/local/2.2.3
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file


# adding multiple resources in one main.tf file

resource "local_file" "cat_res" {
    filename = "cat.txt"
    content = "I love cats"
}

resource "local_file" "dog_res" {
    filename = "dog.txt"
    content = "I love dogs"
}