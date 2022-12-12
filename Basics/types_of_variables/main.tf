# lecture-13: Types of variables



# variable is in variable.tf file

resource "local_file" "sample_res" {
    filename = var.filename1
#    content = var.content1
# line below for "type = list(string)"
# line below for "type = tuple([string,bool,number])""
#    content = var.content1[2]

# line below for "type = map"
#    default = {name = "Taro", age =18}
    content = var.content1["name"]
#    content = var.content1["age"]

#    file_permission = "0700"
}