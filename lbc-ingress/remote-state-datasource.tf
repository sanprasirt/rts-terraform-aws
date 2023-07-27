# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "sanprasirt-eks-trs-s3"
    key    = "dev/eks-terraform-manifests/terraform.tfstate"
    region = var.aws_region
  }
}
