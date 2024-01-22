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

resource "scaleway_vpc_private_network" "k8s-network" {
  name = "${var.env_prefix}-k8s-network"
}

resource "scaleway_k8s_cluster" "k8s-cluster" {
  name    = "${var.env_prefix}-k8s-cluster"
  description = "${var.env_prefix}-k8s-cluster"
  type    = "kapsule"
  version = var.k8s_cluster_version
  cni     = "cilium"
  private_network_id = scaleway_vpc_private_network.k8s-network.id
  delete_additional_resources = false
}

resource "scaleway_k8s_pool" "my-pool" {
  cluster_id  = scaleway_k8s_cluster.k8s-cluster.id
  name        = "${var.env_prefix}-k8s-pool"
  node_type   = "DEV1-M"
  size        = 2
  min_size    = 0
  max_size    = 3
  autoscaling = true
  autohealing = true
}

