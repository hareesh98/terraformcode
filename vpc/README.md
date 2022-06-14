# creating aws vpc using terraform code


## Downloading the code

```
git clone https://github.com/purushothamkdr453/terraform-code.git
cd terraform-code/vpc
```

`terraform.tfvars` is the file which contains all the inputs required for terraform code. Update the values of these file as per your requirements. In this case I am creating an aws vpc in ap-south-1 region(Mumbai)

**Note** Makesure you update the access key & secret key values prior running other commands & also change other attributes like vpccidr, public subnetcidr & private subnetcidr as per your requirements.

# creating aws vpc using terraform

```
terraform init # this command is used to initialize the terraform aws provider
terraform plan # This command will display the resources that will be created(dry run)
terraform apply -auto-approve # this command will provision the infrastructure
```
