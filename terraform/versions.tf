# Purpose: Define the versions of Terraform and the AWS provider that our project supports.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.70.0"
    }
  }
}


# required_version: Terraform must be version 1.5 or newer, but below 2.0.
# ource: downloads the official AWS provider from HashiCorp.
# version = "~> 6.0": allows AWS provider versions from 6.0 up to, but not including, 7.0.

# The version constraint allows compatible updates. Once we initialize the project, .terraform.lock.hcl will record the selected provider version.

