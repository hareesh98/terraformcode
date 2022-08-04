access_key = "<ACCESS KEY>" # Access key
secret_access_key = "<SECRET ACCESS KEY" # Secret access key
region = "ap-south-1" # Region
instance_type = "t2.micro" # instance type
ami = "ami-079b5e5b3971bd10d" # AMI ID
associate_public_ip_address = true # Assigning public ip address
monitoring = false # enabling monitoring or not
subnet_id = "subnet-0a035b11d27bfba95" # Subnet id where you want to launch instance in
vpc_security_group_ids = [ "sg-09ef794ec9e884d95" ] # Security group to be attached to ec2 instance
tags = {
  "Name" = "Test-Instance"
  "Env"  = "Dev"
}


