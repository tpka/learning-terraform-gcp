# lecture 61:

# google_bigtable_instance: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance
# google_bigtable_table: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table


# creating instance
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance#example-usage---simple-instance
resource "google_bigtable_instance" "name-from-tf" {
  name = "bt-from-tf"
  deletion_protection = false
  labels = {
    my-label = "test-label"
    env = "test"
  }  
  cluster {
    cluster_id   = "bt-from-tf-1"
    num_nodes    = 1
    storage_type = "HDD"
  }
}

# creating blank table
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table#example-usage
resource "google_bigtable_table" "tb1" {
  name = "tb-from-tf"
  instance_name = google_bigtable_instance.name-from-tf.name
  
}