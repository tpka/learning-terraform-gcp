# lecture: 21

# first block
data "local_file" "name" {
    filename = "sample1.txt"  
}

# second block
output "name1" {
    value = data.local_file.name.content
}