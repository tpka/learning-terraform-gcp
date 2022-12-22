# lecture 57:

# google_spanner_instance: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance
# google_spanner_database: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_database

# creating instance
resource "google_spanner_instance" "spanner_tf" {
    name = "spanner-tf"
    config = "regional-asia-southeast1"
    display_name = "Spanner from TF"
    num_nodes = 1
    labels = {
      "env" = "learning-tf"
    }
}

# creating database
resource "google_spanner_database" "db1" {
    name = "db1"
    instance = google_spanner_instance.spanner_tf.name
}


