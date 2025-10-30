variable "network_name" {
  description = "The name of the VPC network"
  type = string
  
}

variable "subnetwork_name" {
  description = "The name of the subnetwork"
  type = string
}
variable "machine_type" {
  description = "The machine type for the compute instance"
  type = string
}
variable "disk_image" {
  description = "Name of the disk image"
  type = string
  
}

variable "disk_size" {
  description = "Size of the disk in GB"
  type = number
}

variable "instance_name" {
  description = "The name of the compute instance"
  type = string
}

variable "zone" {
  description = "The zone for server"
  type = string
  
}

variable "firewall_name" {
  description = "The name of the firewall rule"
  type = string
  
}