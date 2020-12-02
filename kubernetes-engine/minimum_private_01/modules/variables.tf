// common
variable "project_id" {
  type = string
}
variable "env" {
  type = string
}
locals {
  region = "asia-northeast1"
}

// network
locals {
  network_name           = "sample-vpc"
  subnet_name            = "sample-subnet"
  ip_range_pods_name     = "ip-range-pods"
  ip_range_services_name = "ip-range-services"
}

// bastion
variable "bastion_members" {
  type = list(string)
}
locals {
  bastion_name = format("%s-bastion", local.cluster_name)
  bastion_zone = format("%s-b", local.region)
}

// gke
locals {
  cluster_name = format("minimum-private-cluster-%s", var.env)
}
