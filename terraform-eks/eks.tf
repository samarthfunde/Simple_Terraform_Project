module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  cluster_name    = local.name
  cluster_version = "1.29"

  # API access
  cluster_endpoint_public_access = true

  # Networking
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  # Cluster addons
  cluster_addons = {
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
  }

  # Node group defaults
  eks_managed_node_group_defaults = {
    instance_types = ["t3.small"]
  }

  # Managed node groups
  eks_managed_node_groups = {
    cws-cluster-ng = {
      instance_types = ["t3.medium"]

      min_size     = 2
      max_size     = 2
      desired_size = 2

      capacity_type = "SPOT"
    }
  }

  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
