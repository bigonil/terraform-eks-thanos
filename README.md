# terraform-eks-thanos

Terraform module to deploy an AWS EKS Cluster with Thanos installed via Helm.

## Features

- Creates an EKS cluster using the official AWS EKS Terraform module
- Deploys Thanos using the Bitnami Helm chart
- Supports custom configuration for cluster name, version, node type, and Thanos object storage

## Usage

```hcl
module "eks_thanos" {
  source                = "./eks-thanos"
  aws_region            = "eu-west-1"
  cluster_name          = "my-eks-cluster"
  cluster_version       = "1.29"
  vpc_id                = "vpc-xxxxxxx"
  subnets               = ["subnet-xxxxxx", "subnet-yyyyyy"]
  node_instance_type    = "t3.medium"
  thanos_objstore_type  = "s3"
}
```

## Input Variables

See [input.tf](./input.tf) and [variables.tf](./variables.tf) for a full list of input variables.

| Name                | Description                                 | Type          | Default     | Required |
|---------------------|---------------------------------------------|---------------|-------------|----------|
| aws_region          | AWS region                                  | string        | n/a         | yes      |
| cluster_name        | EKS cluster name                            | string        | n/a         | yes      |
| cluster_version     | Kubernetes version for EKS                  | string        | "1.29"      | no       |
| vpc_id              | VPC ID where the cluster will be created    | string        | n/a         | yes      |
| subnets             | List of subnet IDs                          | list(string)  | n/a         | yes      |
| node_instance_type  | Instance type for the nodes                 | string        | t3.medium   | no       |
| thanos_objstore_type| Object storage type for Thanos (e.g., s3)   | string        | s3          | no       |

## Outputs

See [output.tf](./output.tf) for all outputs.

| Name                  | Description                      |
|-----------------------|----------------------------------|
| eks_cluster_name      | EKS cluster name                 |
| eks_cluster_endpoint  | EKS cluster endpoint             |
| thanos_release_status | Helm release status for Thanos   |

## Requirements

- Terraform >= 1.0
- AWS provider
- Helm provider

## License

Apache 2.0
