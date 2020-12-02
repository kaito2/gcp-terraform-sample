terraform {
  backend "gcs" {
    # tfstate-${GCP_PROJECT_ID}
    bucket = "tfstate-<YOUR_PROJECT_ID>"
  }
}

module "public-cluster" {
  source     = "../modules"
  env        = "prod"
  project_id = "<YOUR_PROJECT_ID>"
  bastion_members = [
    "user:<YOUR_EMAIL_ADDRESS>"
  ]
}
