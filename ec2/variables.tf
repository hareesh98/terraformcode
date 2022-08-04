variable "access_key" {
  description = "aws access key"
  type        = string
}

variable "secret_access_key" {
  description = "aws secret access key"
  type        = string
}

variable "region" {
  description = "aws region"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "instance ami"
  type = string
}

variable "associate_public_ip_address" {
  description = "assigning public ip address"
  type = bool
}

variable "monitoring" {
  description =  "enabling monitoring"
  type = bool
  default = "false"
}

variable "vpc_security_group_ids" {
  description =  "VPC Security groups to attach to ec2 instance"
  type = list
}

variable "subnet_id" {
  description = "subnet id"
  type = string
}

variable "tags" {
  description =  "ec2 instance tags"
  type = map
}