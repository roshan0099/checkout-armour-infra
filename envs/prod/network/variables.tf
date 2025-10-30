variable "network_name" {
  description = "network name"
  type        = string
}


variable "subnetwork_name" {
  description = "subnetwork name"
  type        = string
}

variable "subnetwork_cidr_private" {
  description = "subnetwork cidr"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnetwork_cidr_public" {
  type = string
  description = "public subnetwork cidr"
  default = "10.0.2.0/24"
}


variable "region" {
  type        = string
  default     = "us-central1"
}

variable "subnetwork_name_private" {
  description = "private subnetwork name"
  type        = string
  
}