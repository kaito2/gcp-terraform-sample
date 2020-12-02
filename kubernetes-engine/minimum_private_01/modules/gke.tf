module "gke" {
  // Modified
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "v12.1.0"

  grant_registry_access = true
  ip_range_pods         = local.ip_range_pods_name
  ip_range_services     = local.ip_range_services_name
  name                  = local.cluster_name
  network               = module.vpc.network_name
  node_pools = [
    {
      machine_type = "n2-standard-2"
      name         = "default-node-pool"
    }
  ]
  project_id               = var.project_id
  region                   = local.region
  remove_default_node_pool = true
  subnetwork               = local.subnet_name

  // Added
  // enable_private_endpoint = false
  enable_private_nodes = true
  master_authorized_networks = [{
    cidr_block   = "${module.bastion.ip_address}/32"
    display_name = "Bastion Host"
  }]
}
