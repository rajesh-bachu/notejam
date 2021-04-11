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
  region = "eu-central-1"
  version = "~> 3.36.0"
}
