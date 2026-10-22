# EKS Lab — Infrastructure as Code

## Overview

This project provisions an Amazon Elastic Kubernetes Service (EKS)
platform using Terraform and AWS. It follows infrastructure-as-code,
security, documentation, and controlled deployment practices.

## Objectives

- Create AWS networking with Terraform.
- Provision an EKS Kubernetes control plane.
- Create an EKS managed node group.
- Separate cluster and worker-node IAM roles.
- Manage Terraform state securely in an S3 backend.
- Automate Terraform validation and planning with GitHub Actions.
- Use GitHub OIDC for temporary AWS credentials.
- Document deployment, verification, and cleanup.

## Technology Stack

- AWS
- Amazon EKS
- Terraform
- Git and GitHub
- GitHub Actions
- AWS IAM and GitHub OIDC

## Repository Structure

- `docs/` — architecture, deployment guide, and design decisions.
- `terraform/bootstrap/` — remote Terraform state prerequisites.
- `terraform/environments/dev/01-network/` — VPC and networking.
- `terraform/environments/dev/02-eks-cluster/` — EKS control plane and access.
- `terraform/environments/dev/03-node-groups/` — managed worker nodes.
- `.github/workflows/` — Terraform CI/CD workflows.

## Deployment Order

1. Bootstrap the remote Terraform state backend.
2. Provision the VPC and networking.
3. Provision the EKS cluster.
4. Provision the managed node group.
5. Configure and verify Kubernetes access.
6. Deploy and test a sample workload.
7. Destroy lab resources safely when finished.

Each infrastructure layer uses a separate Terraform root configuration
and state. Outputs and inputs will explicitly connect dependent layers.

## Security Principles

- Use least-privilege IAM permissions.
- Keep EKS cluster and node IAM roles separate.
- Restrict EKS API endpoint access.
- Never commit AWS credentials, sensitive variable files, or Terraform state.
- Use GitHub OIDC rather than long-lived AWS keys in GitHub Actions.
- Review Terraform plans before applying changes.

## Cost Awareness

EKS, EC2, NAT gateways, load balancers, storage, and logging may incur
charges. Review expected costs before provisioning and remove unused
resources when the lab is complete.

## Status

Documentation and repository foundation are in progress.
Infrastructure has not yet been provisioned by this project.

## Documentation

- [Architecture](docs/architecture.md)
- [Deployment Guide](docs/deployment-guide.md)
- [Architecture Decisions](docs/decisions.md)
