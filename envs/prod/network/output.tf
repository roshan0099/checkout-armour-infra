
output "network_name" {
  value = google_compute_network.checkout-vpc.id
  
}

output "subnetwork_private" {
  value = google_compute_subnetwork.private-subnet.id

}

output "peering_connection" {
  value = google_service_networking_connection.peering.id
  
}