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