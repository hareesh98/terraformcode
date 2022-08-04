# creating aws ec2 instance using terraform code


## Downloading the code

```
git clone https://github.com/purushothamkdr453/terraform-code.git
cd terraform-code/ec2
```

`terraform.tfvars` is the file which contains all the inputs required for terraform code. Update the values of these file as per your requirements. In this case I am creating an ec2 instance(t2.micro) in ap-south-1 region. 

**Note** Makesure you update the access key & secret key values prior running other commands.

# Pre-requisities

Makesure you have already created VPC, Subnet, security and other networking related components. Incase if you have not created Please follow the instructions specified here - https://github.com/purushothamkdr453/terraform-code/tree/main/vpc

# Generating ssh key

```
ssh-keygen -f terraform
```

the above command generates private key & public key. Makesure you place the public key(which ends with .pub extension) in the current directory.

# creating ec2 instance using terraform

```
terraform init # this command is used to initialize the terraform aws provider
terraform plan # This command will display the resources that will be created(dry run)
terraform apply -auto-approve # this command will provision the infrastructure
```

# Accessing the webapplication

Get the public ip of ec2 instance created and enter it in the browser you should see a sample webcontent. Incase if you are not able to view it then wait for sometime and refresh again.