# lecture-12: Intro to variables



# variable is in variable.tf file

resource "local_file" "sample_res" {
    filename = var.filename
    content = var.content
#    file_permission = "0700"
}