terraform_version_constraint = "~>1.9.2"
remote_state {
  backend = "s3"
  generate = {
    path      = "remote-state.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "s3-tf-state-tg-reorg"

    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "dynamo-terraform-lock"
  }
}
generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
    region = "us-east-1"
}
EOF
}

generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
 } 
EOF
}