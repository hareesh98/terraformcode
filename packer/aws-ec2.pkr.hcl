packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_prefix" {
  type    = string
  default = "testami"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "sourceami" {
  type    = string
}

variable "username" {
  type    = string
  default = "ec2-user" 
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ec2" {
  ami_name      = "${var.ami_prefix}-${local.timestamp}"
  instance_type = "${var.instance_type}"
  region        = "${var.region}"
  source_ami    = "${var.sourceami}"
  ssh_username  = "${var.username}"
}

build {
  name = "goldenami-creation"
  sources = [
    "source.amazon-ebs.ec2"
  ]
  
  provisioner "shell" {
    inline = [
      "echo installing httpd",
      "sleep 30",
      "sudo yum update -y",
      "sudo yum install -y httpd",
    ]
  }

  provisioner "shell" {
    script = "./scripts/restartservice.sh"
  }
  
  post-processors {
      post-processor "vagrant" {}
      post-processor "compress" {}
  }

}
