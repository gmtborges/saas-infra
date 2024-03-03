terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    tier = "public"
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ec2_ami # Replace with the AMI ID for Debian 11 in your region
  instance_type = var.ec2_instance_type
  key_name      = var.app + "-ec2-key" # Replace with your SSH key name

  security_groups = [aws_security_group.allow_web.name]

  tags = {
    Name = var.app + "_server"
  }
}
