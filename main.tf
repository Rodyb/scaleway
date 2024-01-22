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
module "iam" {
  source = "./modules/iam"
  env_prefix = var.env_prefix
  zone = var.zone
  region = var.region
  qa_users = ["user1@example.com", "user2@example.com", "user3@example.com"]
}