terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer-mysql-sa"]
  }
}

data "aws_eip" "my_instance_eip" {
  public_ip = "3.220.181.223"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_instance.id
  allocation_id = data.aws_eip.my_instance_eip.id
}

resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = "packer_key"
  monitoring             = true
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0831e267a4376280c"]

  user_data = "${file("user_data123.sh")}"

  tags = {
    Name = "terraform-app"
  }
 
}

