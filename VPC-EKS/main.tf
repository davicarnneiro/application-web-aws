terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

module "devops_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name            = "devops-vpc"
  cidr            = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  azs             = ["us-west-1a", "us-west-1b"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/devops-eks" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/devops-eks" = "shared"
    "kubernetes.io/role/elb"                  = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/devops-eks" = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }

}

module "devops_eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name    = "devops-eks"
  cluster_version = "1.27"

  subnet_ids                     = module.devops_vpc.private_subnets
  vpc_id                         = module.devops_vpc.vpc_id
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    live = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t3.medium"]
    }
  }
}