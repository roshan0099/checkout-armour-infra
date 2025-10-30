

module "network" {
  source = "./network"
  network_name = "checkout-vpc"
  subnetwork_name = "checkout-public-subnet"
  subnetwork_name_private = "checkout-private-subnet"
}

module "compute_instance" {
  source = "./compute_instance"
  instance_name = "checkout-app-server"
  machine_type = "e2-micro"
  disk_image  = "debian-cloud/debian-11"
  disk_size  = 10
  zone  = "us-central1-a"
  firewall_name = "checkout-vm-firewall"
  network_name = module.network.network_name
  subnetwork_name = module.network.subnetwork_private
}

module "namebucket" {
  source = "./artifact"
  region = "us-central1"
  project = "checkout-armour"
}

module "cloudsql" {
  source = "./cloudsql"
  network_vpc = module.network.network_name
  module_name = module.network.peering_connection
}

