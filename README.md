# Terraform EKS Project (Using Modules)

## Overview
This project uses **Terraform modules** to provision an **AWS EKS (Elastic Kubernetes Service) cluster** in a clean, reusable, and production-style structure.

---

## Architecture
- AWS VPC
- Public & Private Subnets
- EKS Cluster
- Managed Node Group

All resources are created using **Terraform modules**.

---

## Project Structure
```
terraform-eks-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
└── modules/
    └── terraform-eks/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

---

## Deployment Commands

### Step 1: Initialize Terraform
```bash
terraform init
```

### Step 2: Format Code
```bash
terraform fmt -recursive
```

### Step 3: Validate Configuration
```bash
terraform validate
```

### Step 4: Plan Infrastructure
```bash
terraform plan
```

### Step 5: Apply Configuration
```bash
terraform apply
```
Or auto-approve:
```bash
terraform apply -auto-approve
```
---

## Useful Commands

### Check Terraform State
```bash
terraform show
terraform state list
```

### View Outputs
```bash
terraform output
```

### Refresh State
```bash
terraform refresh
```

### Destroy Infrastructure
```bash
terraform destroy
```
Or auto-approve:
```bash
terraform destroy -auto-approve
```

---
