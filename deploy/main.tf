terraform {
  backend "s3" {
    bucket         = "terraform-state-rajeshbachu"
    key            = "notejam.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "tf-state-lock"
  }
}

provider "aws" {
  region  = "eu-central-1"
  version = "~> 3.36.0"
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"
  }
}
data "aws_region" "current" {}