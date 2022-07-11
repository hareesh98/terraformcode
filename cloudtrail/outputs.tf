output "cloudtrail_bucket" {
  description = "Cloudtrail events/logs pushed to the following bucket"
  value       = aws_s3_bucket.cloudtrail.id
}

output "Cloudwatch_loggroup" {
  description = "cloudwatch log group"
  value       = aws_cloudwatch_log_group.cloudtrailloggroup.arn
}
