# creating aws ec2 instance using terraform code


## Downloading the code

```
git clone https://github.com/purushothamkdr453/terraform-code.git
cd terraform-code/ec2
```

`terraform.tfvars` is the file which contains all the inputs required for terraform code. Update the values of these file as per your requirements. In this case I am creating an ec2 instance(t2.micro) in ap-south-1 region. 

**Note** Makesure you update the access key & secret key values prior running other commands.

# creating ec2 instance using terraform

```
terraform init # this command is used to initialize the terraform aws provider
terraform plan # This command will display the resources that will be created(dry run)
terraform apply -auto-approve # this command will provision the infrastructure
```
