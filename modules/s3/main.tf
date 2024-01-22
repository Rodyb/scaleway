terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone   = var.zone
  region = var.region
}

resource "scaleway_object_bucket" "s3-bucket" {
  name = "${var.env_prefix}-s3-bucket-new"
  object_lock_enabled = true
}

resource "scaleway_object_bucket_lock_configuration" "main" {
  bucket = scaleway_object_bucket.s3-bucket.name

  rule {
    default_retention {
      mode = "GOVERNANCE"
      days = 1
    }
  }
}