#!/bin/sh -e

if [ $# -ne 1 ]; then
  cat << EOF
Usage:
    ${0} <GCP_PROJECT_ID>
EOF
  exit 1
fi

readonly GCP_PROJECT=$1

gsutil mb -p "${GCP_PROJECT}" -c multi_regional -l asia "gs://tfstate-${GCP_PROJECT}/"
