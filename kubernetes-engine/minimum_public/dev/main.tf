terraform {
  backend "gcs" {
    # tf-state-${GCP_PROJECT_ID}
    bucket = "tf-state-sample-project-dev"
  }
}

module "public-cluster" {
  source     = "../modules"
  env        = "dev"
  project_id = "sample-project-dev"
}
