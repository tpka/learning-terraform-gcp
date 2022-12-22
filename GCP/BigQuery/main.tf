# lecture 54:

# google_bigquery_dataset: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
# google_bigquery_table: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table

# creating dataset
resource "google_bigquery_dataset" "bq_ds" {
    dataset_id = "bs_from_tf"
}

# creating table
resource "google_bigquery_table" "table_tf" {
    table_id = "table_from_tf"
    dataset_id = google_bigquery_dataset.bq_ds.dataset_id
    deletion_protection = false
}