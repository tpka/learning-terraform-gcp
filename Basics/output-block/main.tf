# lecture:18
# See also file in lecture-11: Random provider

resource "random_string" "rand_name" {
    length = 20
}
