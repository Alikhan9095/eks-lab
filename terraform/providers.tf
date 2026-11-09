provider "aws" {
  region = var.aws_region

}

# This tells Terraform to use the AWS provider in the region specified by our input variable.
# We will use ap-south-1 (Mumbai) for this project.

