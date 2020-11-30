// common
locals {
  // project_id = "sample-project-dev"
  project_id = "sample-project-dev"
  region     = "asia-northeast1"
}

// network
locals {
  network_name           = "sample-vpc"
  subnet_name            = "sample-subnet"
  ip_range_pods_name     = "ip-range-pods"
  ip_range_services_name = "ip-range-services"
}

module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.5"
  project_id   = local.project_id
  network_name = local.network_name
  subnets = [
    {
      subnet_name   = local.subnet_name
      subnet_ip     = "10.0.0.0/17"
      subnet_region = local.region
    },
  ]

  secondary_ranges = {
    (local.subnet_name) = [
      {
        range_name    = local.ip_range_pods_name
        ip_cidr_range = "10.1.0.0/17"
      },
      {
        range_name    = local.ip_range_services_name
        ip_cidr_range = "192.168.64.0/18"
      }
    ]
  }
}

module "gke" {
  source            = "terraform-google-modules/kubernetes-engine/google"
  version           = "v12.1.0"
  project_id        = local.project_id
  name              = "minimum-configuration-cluster"
  region            = local.region
  network           = module.vpc.network_name
  subnetwork        = local.subnet_name
  ip_range_pods     = local.ip_range_pods_name
  ip_range_services = local.ip_range_services_name
}
