terraform {
  required_version = "~> 1.13.0"
  required_providers {
    aws = {
        versiom = "~> 6.10.0"
        source = "hashicorp/aws"
    }
  }
}