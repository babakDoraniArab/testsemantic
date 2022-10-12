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

#////////////////////////////////
#  Security Group
#////////////////////////////////

resource "aws_security_group" "prod_web" {
  name        = "prod-web2"
  description = "Allow standard http and https ports inbount and everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}
#//////////////////////////////
#       resouce ec2
#//////////////////////////////
resource "aws_instance" "prod_web" {

  ami             = "ami-096f7a9ab885b50f4"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.prod_web.id]
  key_name        = "Demo"
  user_data       = <<-EOF
#!/bin/bash
yum update -y
yum install -y polkit
yum install -y httpd
systemctl start httpd
systemctl enable httpd
yum install -y git
cd /var/www/html
git clone https://github.com/babakDoraniArab/testHtmlTemplate.git
mv testHtmlTemplate/* ./
rm -R testHtmlTemplate
     EOF


#test


  tags = {
    Terraform = "true"
    Name      = "Jenkins"
  }
}

