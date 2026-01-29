# key pair (login)

resource "aws_key_pair" "my_key_new" {
  key_name = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

# VPC & Security Group
resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_security_group" {
  name  = "${var.env}-infa-app-sg"
  description = "this will add a TF generated Security group"
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

resource "aws_instance" "my-ec2" {
  count = var.instance_count

  depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key_new ]
  key_name = aws_key_pair.my_key_new.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type = var.instance_type
  ami  = var.ec2_ami_id
  
  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp3"
  }
  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment = var.env
  }

}