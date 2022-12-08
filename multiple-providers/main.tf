# Lecture-16:

# first provider block
resource local_file name {
    content = "This is HCL"
    filename = "sample.txt"
} 

# second provider block
resource random_string name {
    length = 10
}
