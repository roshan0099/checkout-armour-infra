
resource "google_compute_instance" "app-server" {
  
  name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone 
    boot_disk {
        initialize_params {
        image = var.disk_image
        size  = var.disk_size
        }
    }
    network_interface {
        network    = var.network_name
        subnetwork = var.subnetwork_name
    }
}

resource "google_compute_firewall" "vm-firewall" {
  name    = var.firewall_name
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]

}