variable "env" {
  description = "This is the envirnment for my infra"
  type = string
}

variable "bucket_name" {
  description = "This is the envirnment for my infra"
  type = string
}

variable "instance_count" {
  description = "This is the no. of ec2 instance"
  type = number
}

variable "instance_type" {
  description = "Ths is is instance type"
  type = string
}

variable "ec2_ami_id" {
    description = "This is the instance type for my Ec2"
    type = string
}

variable "hash_key" {
  description = "This is the hash key for dynamodb"
  type = string
}
