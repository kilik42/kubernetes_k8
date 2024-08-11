# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "compute" {
  project = "training-416401"
  service = "compute.googleapis.com"
   disable_on_destroy     = true
  disable_dependent_services = true
}

resource "google_project_service" "container" {
  project = "training-416401"
  service = "container.googleapis.com"
  disable_on_destroy     = true
  disable_dependent_services = true
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                            = var.network_name
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}
