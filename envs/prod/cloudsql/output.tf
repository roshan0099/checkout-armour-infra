output "cloudsql_instance" {
  value = google_sql_database_instance.flask_db_instance.id
}
