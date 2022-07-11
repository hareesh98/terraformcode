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

variable "bucket_name" {
  description = "cloudtrail bucket name"
  type        = string
  default     = "cloudtrail-bucket-11-07-2022"
}

variable "include_global_service_events" {
  description = "include global service events"
  type        = bool
  default     = false
}

variable "enable_log_file_validation" {
  description = "enable log file validation"
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "enable logging"
  type        = bool
  default     = false
}

variable "is_multi_region_trail" {
  description = "enable multi region trail"
  type        = bool
  default     = false
}

variable "is_organization_trail" {
  description = "is organization trail"
  type        = bool
  default     = false
}

variable "cloudwatch_loggroup_name" {
  description = "cloudwatch loggroup name"
  type        = string
  default     = "cloudtrail/logs"
}

variable "cloudtrail_name" {
  description = "cloudtrail name"
  type        = string
  default     = "cloudtrail-main"
}



