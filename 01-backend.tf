# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "wave-terraform-state-01"
    prefix      = "terraform/state"
    credentials = "gcp-01-453500-0c288e425c90.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
