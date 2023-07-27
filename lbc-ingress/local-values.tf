# Define Local Values in Terraform
locals {
  owners      = var.business
  environment = var.environment
  name        = "${var.business}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  eks_cluster_name = data.terraform_remote_state.eks.outputs.cluster_id
} 
