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

variable "vpcid" {
  description = "aws vpc id"
  type        = string
}


variable "security_groups" {
  type        = map(object({
      name  = string
      description = string
      tags        = map(string)
      ingress     = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks  = list(string)
        description = string
        ipv6_cidr_blocks = list(string)
        prefix_list_ids = list(string)
        security_groups = list(string)
      }))
      egress      = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks  = list(string)
        description = string
        ipv6_cidr_blocks = list(string)
        prefix_list_ids = list(string)
        security_groups = list(string)
      }))
}))
}