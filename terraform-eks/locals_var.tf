#this is type of vpc which is "local" we can create in file 

locals {
  region = "ap-south-1"
  name = "cws-eks-cluster"
  vpc_cidr = "10.0.0.0/16"
  azs = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  env = "dev"
  infra_subnets = ["10.0.5.0/24", "10.0.6.0/24"] # infra subnets use for the internal access in the vpc
}