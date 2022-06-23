## Installing packer in macos

Install the packer using below commands.

```
https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_darwin_amd64.zip
cd ~/Downloads
unzip packer_1.8.1_darwin_amd64.zip
chmod +x packer
mv packer /usr/local/bin
```

check whether packer is installed or not using this command 

```
packer --version
```

incase if you get error while running the above command  it means that your mac os didn’t trust packer package. So you need to trust it manually. Follow the below process to trust packer package.

Click Apple Icon(top left of your screen) -> System Preferences -> Security & Privacy -> Select “General” -> Allow Anyway.

Then re execute the command i.e packer --version. This time you should not get any error. 
Click ok if you get any prompts.

## Installing packer in ubuntu

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get update && sudo apt-get install packer
```

## Set aws access key & secret access key

```
export AWS_ACCESS_KEY_ID="<accesskey>"
export AWS_SECRET_ACCESS_KEY="<secretaccesskey>"
```

**Note : ** Replace the above placeholders <accesskey> & <secretaccesskey> with your values.


## Executing packer

```
git clone https://github.com/purushothamkdr453/terraform-code.git
cd terraform-code/packer
```

update the values inside `example.auto.pkrvars.hcl` as per your requirements. The default values of the file contains ami-id for amazon linux in mumbai region.

```
packer init .
packer build -var-file=example.auto.pkrvars.hcl aws-ec2.pkr.hcl
```
