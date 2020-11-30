terraform {
  backend "gcs" {
    # tfstate-${GCP_PROJECT_ID}
    bucket = "tfstate-sample-project-dev"
  }
}

module "public-cluster" {
  source     = "../modules"
  env        = "dev"
  project_id = "sample-project-dev"
}
