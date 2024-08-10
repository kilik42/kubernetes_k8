# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "training-416401"
  region  = "us-central1"
  credentials = "training_key.json"
}
# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "bucket-kubernetes-terraform"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
