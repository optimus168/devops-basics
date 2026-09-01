# Task 5 - Infrastructure as Code with Terraform

## Objective

Use Terraform to provision and manage local infrastructure using Docker as the infrastructure provider.

## Tasks Completed

- Installed Terraform
- Configured the Docker provider
- Created Terraform configuration files
- Provisioned an Nginx container using Terraform
- Created a Docker network
- Created persistent Docker storage
- Built infrastructure using `terraform plan`
- Deployed infrastructure using `terraform apply`
- Updated infrastructure using Terraform
- Destroyed infrastructure using `terraform destroy`

## Technologies Used

- Terraform
- Docker
- Nginx
- Infrastructure as Code (IaC)

## Project Structure

```text
task5/
├── main.tf
└── README.md
```

## Infrastructure

Terraform provisions the following local resources:

```text
Terraform
│
├── Nginx Docker Image
│
├── Docker Network
│
├── Docker Volume
│
└── Nginx Docker Container
        │
        └── Port 8080
```

### Resources

| Resource | Purpose |
|---|---|
| Docker Image | Nginx web server image |
| Docker Container | Containerized application |
| Docker Network | Container networking |
| Docker Volume | Persistent storage |

## Terraform Configuration

The infrastructure is defined in:

```text
main.tf
```

The configuration uses the Docker Terraform provider:

```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}
```

## Initialize Terraform

```bash
terraform init
```

This initializes the Terraform project and downloads the Docker provider.

## Validate Configuration

```bash
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

## Preview Infrastructure

```bash
terraform plan
```

Terraform displays the resources that will be created or modified.

## Deploy Infrastructure

```bash
terraform apply
```

Confirm with:

```text
yes
```

After successful deployment, Terraform displays:

```text
Apply complete!
```

## Verify Docker Resources

Check the running container:

```bash
docker ps
```

Check the Docker network:

```bash
docker network ls
```

Check the Docker volume:

```bash
docker volume ls
```

## Verify Web Application

The Nginx server is accessible through:

```text
http://localhost:8080
```

Opening this URL displays the Nginx welcome page.

## Manage Infrastructure Updates

Terraform can detect and apply infrastructure changes.

For example, changing the host port in `main.tf`:

```hcl
external = 8081
```

Preview the change:

```bash
terraform plan
```

Apply the update:

```bash
terraform apply
```

The application can then be accessed at:

```text
http://localhost:8081
```

This demonstrates infrastructure management through Terraform.

## Destroy Infrastructure

After testing:

```bash
terraform destroy
```

Confirm with:

```text
yes
```

Terraform removes the infrastructure it created.

## Useful Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

## Infrastructure Lifecycle

```text
Terraform Configuration
        ↓
   terraform init
        ↓
  terraform validate
        ↓
    terraform plan
        ↓
   terraform apply
        ↓
 Infrastructure Created
        ↓
 Configuration Updated
        ↓
    terraform plan
        ↓
   terraform apply
        ↓
 Infrastructure Updated
        ↓
  terraform destroy
        ↓
 Infrastructure Removed
```

## Result

Infrastructure was successfully defined and managed as code using Terraform and Docker. An Nginx container, Docker network, and persistent storage were provisioned, updated, tested, and removed using standard Terraform commands.