# lecture-11: Random provider
# https://registry.terraform.io/providers/hashicorp/random/latest/docs


# This will generate random value

resource "random_integer" "rint" {
  min = 80
  max = 200
}

# This will display output of first resource block

output "name1" {
    value = random_integer.rint.result
}