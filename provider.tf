terraform {
  required_provider {
    aws = {
      source = "hasicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "ap-south-1"
}
