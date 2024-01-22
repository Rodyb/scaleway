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

resource "scaleway_iam_group" "qa" {
  name            = "iam_group_qa"
  description     = "basic description"
  application_ids = []
}

resource "scaleway_iam_user" "qa_user" {
  for_each = toset(var.qa_users)

  email = each.value
}

resource "scaleway_iam_group_membership" "qa_membership" {
  for_each = scaleway_iam_user.qa_user

  group_id = scaleway_iam_group.qa.id
  user_id  = each.value.id
}