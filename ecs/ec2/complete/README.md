# Creating ECS EC2 type cluster

**Step-1** Clone the code

```
git clone https://github.com/purushothamkdr453/terraform-code.git
cd ecs/ec2/complete
```

**Step-2** Set the aws environment variables

```
export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxx" 
export AWS_SECRET_ACCESS_KEY="xxxxxxxxxxxxxxxxxxxxxxxxxx" 
export AWS_DEFAULT_REGION="your-region-1"
```

Set the environment variables, replace the above values with yours.

**Step-3** Executing terraform commands

```
terraform init
terraform plan
terraform apply
```

**Step-4** Verifying the resources

After executing the `terraform apply` it should create ec2 cluster with 1 task & 1 service you can be seen in the aws console.