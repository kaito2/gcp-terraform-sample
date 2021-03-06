module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.5"

  network_name = local.network_name
  project_id   = var.project_id
  secondary_ranges = {
    (local.subnet_name) = [
      {
        range_name    = local.ip_range_pods_name
        ip_cidr_range = "10.1.0.0/17"
      },
      {
        range_name    = local.ip_range_services_name
        ip_cidr_range = "192.168.64.0/18"
      },
    ]
  }
  subnets = [
    {
      subnet_name   = local.subnet_name
      subnet_ip     = "10.2.0.0/17"
      subnet_region = local.region
    },
  ]
}

// Added
module "cloud-nat" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "~> 1.2"

  project_id    = var.project_id
  region        = local.region
  router        = "safer-router"
  network       = module.vpc.network_self_link
  create_router = true
}
