network_name = "main"
subnetwork_name = "private"
gke = {
  name     = "my-gke-cluster"
  regional = true
  zones    = ["us-central1-a", "us-central1-b", "us-central1-c"]
}
node_pool = {
  name               = "default-node-pool"
  machine_type       = "e2-medium"
  spot               = false
  initial_node_count = 3
  max_count          = 5
  disk_size_gb       = 20
}
