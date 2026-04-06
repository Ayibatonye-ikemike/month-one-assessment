# TechCorp Web Application Infrastructure

This repository contains the Terraform configuration for TechCorp's new high-availability web application. The infrastructure is designed with a focus on security, scalability, and network isolation.

## Infrastructure Overview
- **VPC:** 10.0.0.0/16 with DNS support.
- **Networking:** 2 Public Subnets (ALB & Bastion) and 2 Private Subnets (Web & DB) across two Availability Zones.
- **Compute:** 
  - 1 Bastion Host (Public Subnet) for administrative access.
  - 2 Web Servers (Private Subnets) running Apache.
  - 1 Database Server (Private Subnet) running PostgreSQL 15.
- **Load Balancing:** Application Load Balancer (ALB) in public subnets.
- **Security:** Security Groups following the principle of least privilege.

## Prerequisites
- Terraform v1.0.0+
- AWS CLI configured with appropriate credentials.
- An existing AWS Key Pair.

## Deployment Steps
1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/month-one-assessment.git
   cd month-one-assessment
   ```

2. **Initialize & Apply:**
   ```bash
   terraform init
   terraform apply -auto-approve
   ```

## Verification
- **Web Access:** Access the ALB DNS name (found in outputs) to see the Apache landing page and Instance ID.
- **SSH Access:** Use SSH agent forwarding to jump from the Bastion to the Private instances.
- **Database:** Connect via `psql -h <db_private_ip> -U postgres`.

## Cleanup
```bash
terraform destroy -auto-approve
```
