#Terraform End-to-End DevOps Project
Project Overview

This project demonstrates an end-to-end DevOps infrastructure setup using Terraform on AWS. It includes provisioning of networking, compute, container services, and database resources following best practices.

The goal is to automate infrastructure creation and manage it using Infrastructure as Code (IaC).

Architecture

This project provisions:

VPC with public & private subnets
Internet Gateway & NAT Gateway
Route Tables
Security Groups
EC2 / ECS (for application deployment)
ECR (for Docker image storage)
RDS (for database)
S3 (for Terraform backend state storage)
DynamoDB (for state locking)


⚙️ Technologies Used
Terraform
AWS (ap-south-1)
Docker
Node.js (App)
Git & GitHub


This project uses a remote backend for state management:

S3 Bucket: pragati-terraform-state-bucket-12345
DynamoDB Table: terraform-lock-table
Region: ap-south-1
terraform {
  backend "s3" {
    bucket         = "pragati-terraform-state-bucket-12345"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
🚀 How to Run This Project
1️⃣ Clone the Repository
git clone https://github.com/your-username/Terraform-project.git

cd Terraform-project
2️⃣ Initialize Terraform

terraform init
3️⃣ Validate Configuration

terraform validate
4️⃣ Plan Infrastructure

terraform plan
5️⃣ Apply Infrastructure

terraform apply
🐳 Docker & ECR Steps (if using ECS)

Login to ECR
aws ecr get-login-password --region ap-south-1 | \
docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.ap-south-1.amazonaws.com
Build & Push Image
docker build -t app .
docker tag app:latest <ECR-URL>
docker push <ECR-URL>


🧹 Cleanup

To destroy all resources:

terraform destroy


Pragati Singh
