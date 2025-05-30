provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = var.subnets
  vpc_id          = var.vpc_id
  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = [var.node_instance_type]
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = module.eks.cluster_token
  }
}

resource "helm_release" "thanos" {
  name             = "thanos"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "thanos"
  namespace        = "thanos"
  create_namespace = true

  set {
    name  = "objstoreConfig.type"
    value = var.thanos_objstore_type
  }
}