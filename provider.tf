terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "ap-south-1"
}
