terraform {
  backend "gcs" {
    # tfstate-${GCP_PROJECT_ID}
    bucket = "tfstate-sample-project-prod"
  }
}

module "public-cluster" {
  source     = "../modules"
  env        = "prod"
  project_id = "sample-project-prod"
}
