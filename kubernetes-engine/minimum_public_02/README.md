# Public Kuberentes Cluster

Create GCS bucket to put the state file in.

```
$ ./create_tf_bucket.sh <GCP_PROJECT_ID>
```

**Edit `bucket`, `project_id` in `dev/main.tf` .**

Deploy

```
$ cd dev
$ terraform init
$ terraform apply
```
