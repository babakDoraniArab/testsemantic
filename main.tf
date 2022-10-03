provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}
#////////////////////////////////
#  Variables
#////////////////////////////////
variable "web_app_name" {
  type = string
}
variable "whitelist" {
  type = list(string)
}
variable "web_instance_type" {
  type = string
}
variable "web_key_name" {
  type = string
}

#//////////////////////////////
#       resouce ec2
#//////////////////////////////
resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.web_instance_type
  key_name        = var.web_key_name
  security_groups = [aws_security_group.aws_jenkins.name]


  tags = {
    Terraform = "true"
    Name      = "Jenkins"
  }
}
