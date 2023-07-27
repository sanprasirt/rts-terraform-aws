locals {
  owner       = var.devision
  environment = var.environment
  name        = "${var.devision}-${var.environment}"
  common_tags = {
    Owner       = var.devision
    Environment = var.environment
    Create_by   = "Sanprasirt.b"
  }

  eks_cluster_name = "${local.name}-${var.cluster_name}"
}
