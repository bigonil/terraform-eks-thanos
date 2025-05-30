variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "VPC ID where the cluster will be created"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "node_instance_type" {
  description = "Instance type for the nodes"
  type        = string
  default     = "t3.medium"
}

variable "thanos_objstore_type" {
  description = "Object storage type for Thanos (e.g., s3)"
  type        = string
  default     = "s3"
}