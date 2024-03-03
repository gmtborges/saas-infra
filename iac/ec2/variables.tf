variable "ec2_instance_type" {
  type    = string
  default = "t4g.micro"
}

variable "ec2_ami" {
  type    = string
  default = "ami-04828c49731751662" # Debian 11 ARM
}

variable "app" {
  type    = string
  default = "app"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0a5e6c5e3e3e3e3e3"
}
