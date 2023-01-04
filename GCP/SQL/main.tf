# lecture 59:

# google_sql_database_instance: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance
# google_sql_user: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user
# google_sql_database: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database

# creating instance
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#argument-reference
resource "google_sql_database_instance" "mysql-from-tf" {
  name             = "mysql-from-tf"
  deletion_protection = false
  database_version = "MYSQL_5_6"
  region           = "asia-southeast1"
# API explore can be used to get the value
# https://cloud.google.com/sql/docs/mysql/admin-api/rest/v1beta4/tiers/list
  settings {
    tier = "db-f1-micro"
  }
}

# creating user for the database
resource "google_sql_user" "myuser" {
  name = "tomo"
# DO NOT store hardcorded password like this !! This is just for testing
# USE HashiCorp Vault or other secret management tool
  password = "CcL&S@KueeUSYvz"
  instance = google_sql_database_instance.mysql-from-tf.name
}
