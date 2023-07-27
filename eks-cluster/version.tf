terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
  backend "s3" {
    bucket         = "sanprasirt-eks-trs-s3"
    key            = "dev/eks-terraform-manifests/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "eks-terraform-state"
    profile        = "rts-aws"
  }
}


provider "aws" {
  region  = "ap-southeast-1"
  profile = "rts-aws"
}



