#!/bin/bash

# Valid environments
if [[ "$1" =~ ^(dev|uat|prod)$ ]]; then
  export TF_WORKSPACE="$1"
  shift
else
  echo "❌ No valid environment set. Usage: ./tf.sh <dev|uat|prod> <terraform_command>"
  exit 1
fi

# Ensure workspace exists and is selected
terraform workspace select "$TF_WORKSPACE" 2>/dev/null || terraform workspace new "$TF_WORKSPACE"

# Run the Terraform command passed
terraform "$@"