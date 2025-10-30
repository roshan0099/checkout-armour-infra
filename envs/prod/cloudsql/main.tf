resource "google_sql_database_instance" "flask_db_instance" {

    name             = "flask-db-instance"
    database_version = "POSTGRES_13"
    region           = "us-central1"
    
    settings {
        tier = "db-f1-micro"
    
        ip_configuration {
        ipv4_enabled = false
        private_network = var.network_vpc
        }
    }
  
  depends_on = [var.module_name]
}

resource "google_sql_database" "flask_db" {
    name     = "flask_db"
    instance = google_sql_database_instance.flask_db_instance.id
}

resource "google_sql_user" "first_user" {
    name     = "flask_user"
    instance = google_sql_database_instance.flask_db_instance.id
    password = "firstguy"
  
}