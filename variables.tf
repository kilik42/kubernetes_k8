variable "network" {
 type = object({
   name                = google_compute_network.main.name
   subnetwork_name     = google_compute_network.private.name
   nodes_cidr_range    = optional(string, "10.128.0.0/20")
   pods_cidr_range     = optional(string, "10.4.0.0/14")
   services_cidr_range = optional(string, "10.8.0.0/20")
 })
}
variable "gke" {
 type = object({
   name     = string
   regional = bool
   zones    = list(string)
 })
}
variable "node_pool" {
 type = object({
   name               = string
   machine_type       = optional(string, "e2-small")
   spot               = bool
   initial_node_count = optional(number, 2)
   max_count          = optional(number, 4)
   disk_size_gb       = optional(number, 10)
})
}
