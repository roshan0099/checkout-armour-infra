
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