# AWS Infrastructure Provisioning with Terraform

This project provisions a highly available and secure AWS infrastructure for a multi-tier application using Terraform.

---

##  Architecture Diagram

![Architecture](terraform-vprofile.jpg)

---

##  Project Structure

| File | Description |
|------|-------------|
| `providers.tf` | Configure Terraform provider and AWS region |
| `backend.tf` | Remote state configuration using S3 |
| `vars.tf` | Define input variables |
| `outputs.tf` | Define Terraform output values |
| `vpc.tf` | Create VPC, subnets, route tables, and NAT Gateway |
| `secgrp.tf` | Security groups for all components |
| `keypairs.tf` | Key pair creation for EC2 and Bastion |
| `bastion-host.tf` | Bastion host in public subnet |
| `bean-env.tf` | Elastic Beanstalk environment configuration |
| `bean-app.tf` | Elastic Beanstalk application and version |
| `backend-services.tf` | RDS, ElastiCache, and MQ Broker setup |
| `vprofilekey.pub` / `vprofilekey` | SSH key pair used to access instances |
| `templates/` | Contains template file for Database initialization |
| `terraform-vprofile.jpg` | Architecture diagram |


---

## Features

- Multi-AZ VPC with public and private subnets
- Bastion host for SSH access
- Elastic Beanstalk for app deployment
- RDS for persistent data storage
- ElastiCache for caching
- MQ Broker for messaging
- Security groups and key pairs for isolation and access control
- S3 bucket for remote Terraform state

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) ≥ 1.0
- AWS CLI configured (`aws configure`)
- IAM permissions to create the required resources
- S3 bucket for backend state (already configured in `backend.tf`)

---

## 🚀 Usage

```bash
# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply infrastructure
terraform apply