variable "ec2_instance_type" {
  type    = string
  default = "t4g.micro"
}

variable "ec2_ami" {
  type    = string
  default = "ami-04828c49731751662" # Replace with the AMI ID for Debian 11 ARM in your region
}

variable "app" {
  type    = string
  default = "app"
}
