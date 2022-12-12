# lecture-11: Random provider
# https://registry.terraform.io/providers/hashicorp/random/latest/docs


# These two section below will generate random value

resource "random_integer" "rint" {
  min = 80
  max = 200
}

resource "random_string" "rstring" {
    length = 17 
}


# These two section below  will display output of first two resource blocks
output "name1" {
    value = random_integer.rint.result
}

output "name2" {
    value = random_string.rstring.result
}