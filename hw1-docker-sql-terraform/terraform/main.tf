terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "data_lake" {
  name     = var.bucket_name
  location = "US"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_name
  location   = "US"
}