variable "network_vpc" {
  description = "The VPC network for the Cloud SQL instance"
  type        = string
  
}

variable "module_name" {
  description = "The name of the network module to depend on"
  type        = string
  
}