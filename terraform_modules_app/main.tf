module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "cws-infra-app-29-jan"
  instance_count = 1
  instance_type = "t2.micro"
  ec2_ami_id = "ami-0ff5003538b60d5ec" #Amzon Linux
  hash_key = "studet-id"
}