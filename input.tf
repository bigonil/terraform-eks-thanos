# Input variables for the eks-thanos module

# aws_region: AWS region where the cluster will be created (string, required)
# cluster_name: EKS cluster name (string, required)
# cluster_version: Kubernetes version for EKS (string, default: 1.29)
# vpc_id: VPC ID where the cluster will be created (string, required)
# subnets: List of subnet IDs (list(string), required)
# node_instance_type: EC2 instance type for the nodes (string, default: t3.medium)
# thanos_objstore_type: Object storage type for Thanos (string, default: s3)