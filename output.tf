output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "thanos_release_status" {
  description = "Helm release status for Thanos"
  value       = helm_release.thanos.status
}