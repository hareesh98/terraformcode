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

variable "vpc_cidr_addr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.1.0.0/26"
}

variable "instance_tenancy" {
  description = "instance tenancy"
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "enable dns support"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "enable dns hostnames"
  type        = bool
  default     = false
}

variable "enable_classiclink" {
  description = "enable classiclink"
  type        = bool
  default     = false
}

variable "enable_classiclink_dns_support" {
  description = "enable classiclink dns support"
  type        = bool
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "assign generated ipv6 cidr block"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  default     = {
     Name = "Testvpc"
}
  description = "Default Tags for VPC"
  type        = map(string)
}

variable "public_subnets" {
   type = list
   default = []
}

variable "private_subnets" {
   type = list
   default = []
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
