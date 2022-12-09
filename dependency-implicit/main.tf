# Lecture-17:

# first provider block
resource local_file name1 {
    filename = "implicit.txt"
    content = "This is random String from random provider : ${random_string.name2.id}"
} 

# second provider block
# in terraform apply, this block will be created first as value in this block will be used in first block
resource random_string name2 {
    length = 10
}
