# EC2 with SSH via Terraform

This repo contains all the required code for creating an Ubuntu EC2 instance in [AWS](https://aws.amazon.com/). This includes the following:

* The instance itself. A free tier eligible Ubuntu Server 22.04 LTS (HVM), SSD Volume Type.
* A security group with SSH access from anywhere.
* An SSH Key Pair, with a private key for instance connection stored on your file system. Do not add this key to git/version control.

FYI: The resources created in AWS should incur no costs, but you can never be sure.

## Prerequisites
* An AWS account ([sign up here](https://portal.aws.amazon.com/billing/signup#/start/email)).
* Access to AWS through the [AWS cli](https://aws.amazon.com/cli/) and a [named profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html#cli-configure-profiles-create). The name of the profile is "default", but can be changed by changing the `profile` default variable in the [variables.tf](variables.tf) file.
* [Terraform](https://www.terraform.io/) installed on your system.
* [SSH](https://www.openssh.com/) (Linux, macOS) or [PuTTY](https://www.putty.org/) (Windows).

## Set up

Initialize terraform the first time: `terraform init`

Display resources to be created (optional): `terraform plan`

Create resources: `terraform apply -auto-approve`

## Connect to instance after creation

TLDR: `ssh -i my-ec2-ubuntu-key-pair.pem ubuntu@$(terraform output ec2_public_dns | tr -d '"')`

You will need the private SSH key, a username and the public DNS of the EC2 to connect via SSH. The key file (`my-ec2-ubuntu-key-pair.pem` ) should be located in your current folder if you have created the resources. The default username on the AMI used is `ubuntu`. To get the public DNS, you can run `terraform output ec2_public_dns`.

## Destroy

To destroy all resources run `terraform destroy`.
