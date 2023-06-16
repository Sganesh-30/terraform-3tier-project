terraform {
  required_provider {
    aws = {
      source = "hasicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
