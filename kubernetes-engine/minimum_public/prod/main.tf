terraform {
  backend "gcs" {
    # tf-state-${GCP_PROJECT_ID}
    bucket = "tf-state-sample-project-prod"
  }
}

module "public-cluster" {
  source     = "../modules"
  env        = "prod"
  project_id = "sample-project-prod"
}
