# variable "network" {
#  type = object({
#    name                = google_compute_network.main.name
#    subnetwork_name     = google_compute_subnetwork.private.name
#    nodes_cidr_range    = optional(string, "10.128.0.0/20")
#    pods_cidr_range     = optional(string, "10.4.0.0/14")
#    services_cidr_range = optional(string, "10.8.0.0/20")
#  })
# }
variable "network_name" {
  description = "Name of the network to use"
  type        = string
  
}

variable "subnetwork_name" {
  description = "Name of the subnetwork to use"
  type        = string
  
}

variable "gke" {
  description = "GKE cluster configuration"
  type = object({
    name     = string
    regional = bool
    zones    = list(string)
  })
}

variable "node_pool" {
  description = "Node pool configuration"
  type = object({
    name               = string
    machine_type       = optional(string, "n2-standard-8")
    spot               = bool
    initial_node_count = optional(number, 2)
    max_count          = optional(number, 4)
    disk_size_gb       = optional(number, 10)
  })
}


variable "zone" {
  description = "The zone where resources will be created"
  type        = string
  default     = "us-central1-a"  # Optional: Set a default zone if you want
}
