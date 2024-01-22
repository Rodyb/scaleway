terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    bucket         = "dev-s3-bucket-new"
    key            = "terraform.tfstate"
    region         = "nl-ams"
    encrypt        = false
    force_path_style = true
    endpoint       = "https://s3.nl-ams.scw.cloud"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

