data "template_file" "startup_script" {
  template = <<-EOF
    sudo apt-get update -y
    sudo apt-get install -y tinyproxy
    EOF
}

module "bastion" {
  source  = "terraform-google-modules/bastion-host/google"
  version = "~> 2.0"

  host_project   = var.project_id
  image_family   = "debian-9"
  image_project  = "debian-cloud"
  machine_type   = "g1-small"
  members        = var.bastion_members
  name           = local.bastion_name
  network        = module.vpc.network_self_link
  project        = var.project_id
  shielded_vm    = "false"
  startup_script = data.template_file.startup_script.rendered
  subnet         = module.vpc.subnets_self_links[0]
  zone           = local.bastion_zone
}
