## Deploy

Create GCS bucket for terraform state files.

```
$ ./create_tf_bucket.sh <YOUR_PROJECT_ID>
```

Replace `project_id` in `dev/main.tf`.

Apply

```
$ cd dev
$ terraform init
...
$ terraform apply
...
```

Confirm communication with GKE.

```
$ export PROJECT_ID=<YOUR_PROJECT_ID>
$ export REGION=asia-northeast1

$ gcloud container clusters get-credentials --project $PROJECT_ID --region $REGION --internal-ip minimum-public-cluster-dev
```

```
$ gcloud beta compute ssh minimum-public-cluster-dev-bastion --tunnel-through-iap --project $PROJECT_ID --zone $REGION-b -- -L8888:127.0.0.1:8888
```

On another terminal,

```
$ HTTPS_PROXY=localhost:8888 kubectl get pods --all-namespaces
...
```
