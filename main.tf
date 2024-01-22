module "kubernetes" {
  source = "./modules/kubernetes"
  env_prefix = var.env_prefix
  zone = var.zone
  region = var.region
  k8s_cluster_version = var.k8s_cluster_version
}

module "instances" {
  source = "./modules/instances"
  env_prefix = var.env_prefix
  zone = var.zone
  region = var.region
}

module "s3" {
  source = "./modules/s3"
  env_prefix = var.env_prefix
  zone = var.zone
  region = var.region
}
