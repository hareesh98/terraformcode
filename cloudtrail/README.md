# Creating cloudtrail using tf code and Sending cloudtrail logs to s3 bucket and cloudwatch log group


## Downloading the code

```
git clone https://github.com/purushothamkdr453/terraform-code.git
cd terraform-code/cloudtrail
```

`terraform.tfvars` is the file which contains all the inputs required for terraform code. Update the values of these file as per your requirements. you can update `cloudtrail name`, `s3 bucket name`, `cloudwatch loggroup name` etc etc as per you needs.

**Note** Makesure you update the access key & secret key values prior running other commands.

**Note** By default multi region trail is disabled. if you want to enable it. update the setting in terraform.tfvars as follows.

```
is_multi_region_trail = true
```

# Creating cloudtrail using tf code and Sending cloudtrail logs to s3 bucket and cloudwatch log group

```
terraform init # this command is used to initialize the terraform aws provider
terraform plan # This command will display the resources that will be created(dry run)
terraform apply -auto-approve # this command will provision the infrastructure
```

`terraform apply` output will display the `s3 bucket name` & `cloudwatch log group` where all api events will be sent.