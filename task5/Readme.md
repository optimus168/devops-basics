# Task 5 - Infrastructure as Code with Terraform

## Objective

Use Terraform to provision and manage cloud infrastructure using Infrastructure as Code (IaC).

## Tasks Completed

- Installed and configured Terraform
- Configured AWS as the cloud provider
- Created Terraform configuration files
- Provisioned a virtual machine using Amazon EC2
- Created networking resources using Amazon VPC
- Created a subnet and security group
- Provisioned storage using Amazon S3
- Used Terraform to plan and deploy infrastructure
- Updated infrastructure using Terraform
- Destroyed infrastructure using Terraform

## Technologies Used

- Terraform
- Amazon Web Services (AWS)
- Amazon EC2
- Amazon VPC
- Amazon S3
- AWS CLI

## Project Structure

```text
task5/
├── main.tf
└── README.md
```

## Terraform Configuration

The infrastructure is defined in:

```text
main.tf
```

The configuration includes:

- AWS provider
- VPC
- Subnet
- Security Group
- EC2 instance
- S3 bucket
- Terraform outputs

## Initialize Terraform

```bash
terraform init
```

This initializes Terraform and downloads the required AWS provider.

## Validate Configuration

```bash
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

## Preview Infrastructure Changes

```bash
terraform plan
```

This displays the resources that Terraform will create or modify.

## Deploy Infrastructure

```bash
terraform apply
```

Confirm with:

```text
yes
```

Terraform then provisions the configured AWS infrastructure.

## Manage Infrastructure Updates

Infrastructure changes can be made by modifying `main.tf`.

For example, changing the EC2 instance type:

```hcl
instance_type = "t3.micro"
```

Then run:

```bash
terraform plan
terraform apply
```

Terraform identifies and applies only the required infrastructure changes.

## View Outputs

After deployment:

```bash
terraform output
```

Example outputs include:

```text
instance_public_ip
bucket_name
```

## Destroy Infrastructure

After completing testing:

```bash
terraform destroy
```

Confirm with:

```text
yes
```

This removes the infrastructure created by Terraform.

## Useful Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

## Infrastructure

The Terraform configuration provisions:

```text
AWS
│
├── VPC
│   └── Subnet
│       └── Security Group
│           └── EC2 Instance
│
└── S3 Bucket
```

## Bonus - Terraform Modules

Terraform modules can be used to organize reusable infrastructure components such as:

```text
modules/
├── networking/
├── compute/
└── storage/
```

This allows infrastructure configurations to be reused across multiple environments.

## Result

AWS cloud infrastructure was successfully provisioned and managed using Terraform. The project demonstrates Infrastructure as Code through automated creation, modification, and destruction of compute, networking, and storage resources.