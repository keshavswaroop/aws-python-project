# Production-Grade AWS Platform

A production-ready cloud platform built on AWS using ECS Fargate, Application Load Balancer, Terraform, and GitHub Actions.

This project demonstrates real-world DevOps practices including secure CI/CD, zero-downtime deployments, and traffic-based auto scaling.

---

## Architecture Overview

- VPC with public and private subnets
- Internet-facing Application Load Balancer
- ECS Fargate services running in private subnets
- NAT Gateway for outbound internet access
- Infrastructure managed using Terraform
- CI/CD implemented using GitHub Actions with OIDC authentication
- Auto scaling based on ALB RequestCountPerTarget metrics

---

## Key Features

- **Production-grade networking** with private workloads
- **Zero-downtime deployments** using ECS rolling updates
- **Secure CI/CD** without storing AWS credentials
- **Traffic-based auto scaling** using ALB metrics
- **Observability** via CloudWatch logs and alarms

---

## CI/CD Flow

1. Code pushed to GitHub
2. GitHub Actions builds Docker image
3. Image pushed to Amazon ECR
4. ECS service redeploys automatically
5. ALB health checks ensure no downtime

---

## Tech Stack

- AWS ECS (Fargate)
- Application Load Balancer
- Terraform
- GitHub Actions
- Docker
- Python (FastAPI)
- CloudWatch

---

## Why This Project?

This project focuses on production-readiness rather than tutorials, covering deployment safety, scalability, security, and operational visibility.

---

## Security

- Secrets managed using AWS Secrets Manager
- Secrets injected into ECS tasks at runtime
- No secrets stored in code, Terraform state, or CI pipelines
- Least-privilege IAM permissions applied to ECS roles
