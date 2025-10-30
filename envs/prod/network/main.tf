

resource "google_compute_network" "checkout-vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public-subnet" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_cidr_public
  region       = var.region
  network      = google_compute_network.checkout-vpc.id
}

resource "google_compute_subnetwork" "private-subnet" {
  name          = var.subnetwork_name_private
  ip_cidr_range = var.subnetwork_cidr_private
  region       = var.region
  network      = google_compute_network.checkout-vpc.id
}

resource "google_compute_router" "checkout-router" {
    name    = "checkout-router"
    network = google_compute_network.checkout-vpc.id
    region  = var.region
}

resource "google_compute_router_nat" "checkout-nat" {
  name  = "checkout-nat"
  router = google_compute_router.checkout-router.name
  region = var.region
  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                     = google_compute_subnetwork.private-subnet.name
    source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
  }
}

resource "google_project_service" "servicenetworking-cloudsql" {
  service = "servicenetworking.googleapis.com"
}

resource "google_compute_global_address" "reserved-ip-range" {
  name          = "reserved-ip-range"
  prefix_length = 24
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network = google_compute_network.checkout-vpc.id
}

resource "google_service_networking_connection" "peering" {
  network                 = google_compute_network.checkout-vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.reserved-ip-range.name]
  depends_on = [google_project_service.servicenetworking-cloudsql]
}