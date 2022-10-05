# Creating AWS RDS Mysql using terraform code


**Step-1**

Make sure you set the aws access key & aws secret key environment variables.

```
export AWS_ACCESS_KEY_ID=<Access key>
export AWS_SECRET_ACCESS_KEY=<secret key>
```

**Step-2**

Execute the following commands.

**Note** change the engine_version in main.tf according to your choice. 

```
terraform init
terraform plan
terraform apply
```
