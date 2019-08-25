terraform {
  backend "s3" {
    key = "main.tfstate"
  }
}

provider "aws" {
  version = "~> 2.25"

  region = "us-east-1"
}

