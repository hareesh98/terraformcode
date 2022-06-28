access_key = "<aws access key>"
secret_access_key = "<aws secret_access_key>"
region = "ap-south-1"
vpcid = "vpc-0af4748618eb36e52"
security_groups = {
    "ec2-sg" = {
       name = "ec2-sg"
       description = "EC2 security group"
       tags = {
         "Name" = "ec2-sg"
       }
       ingress = [
         {
          description      = "Allow ssh access from anywhere"
          from_port        = 22
          to_port          = 22
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
         },
         {
          description      = "Allow http access from anywhere"
          from_port        = 80
          to_port          = 80
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0","10.0.0.0/28"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
         }
       ]
       egress = [
         {
          description      = "Allow all egress access"
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
          ipv6_cidr_blocks = []
          prefix_list_ids = []
          security_groups = []
         }
       ]
    }
    "ecs-sg" = {
       name = "ecs-sg"
       description = "ecs security group"
       tags = {
         "Name" = "ecs-sg"
       }
       ingress = []
       egress  = []
    }
}