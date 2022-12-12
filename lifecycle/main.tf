# lecture: 19

# first block
resource "random_integer" "name" {
    min = 15
    max = 230

        lifecycle {
# see cmd-2.log
#          create_before_destroy = true
# see cmd-3.log
#          prevent_destroy = true
# see cmd-4.log
          ignore_changes = [min, max]
        }

}
