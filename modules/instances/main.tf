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

resource "scaleway_instance_security_group" "instance" {
  inbound_default_policy = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port = "22"
    ip = "212.47.225.64"
  }

  inbound_rule {
    action = "accept"
    port = "80"
  }

  inbound_rule {
    action = "accept"
    port = "443"
  }

  outbound_rule {
    action = "drop"
    ip_range = "10.20.0.0/24"
  }
}

resource "scaleway_instance_server" "web" {
  type  = "DEV1-S"
  image = "ubuntu_jammy"
  security_group_id = scaleway_instance_security_group.instance.id
  user_data = {
    cloud-init = file("entry-script.sh")
  }
}

