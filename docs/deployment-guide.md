# Deployment Guide

## Current Status

The repository foundation is being prepared. Do not run Terraform
against AWS until the configuration, IAM permissions, state backend,
and cost implications have been reviewed.

## Prerequisites

- Git
- AWS CLI
- Terraform
- kubectl
- An AWS identity with appropriately scoped permissions
- Access to the GitHub repository

## Deployment Sequence

### 1. Verify AWS Identity

Run:

    aws sts get-caller-identity

Confirm that the returned account and identity are the intended ones.

### 2. Bootstrap Remote State

Create and configure the S3 state backend using a dedicated bootstrap
configuration. Protect the bucket with encryption, versioning, and
appropriate access controls.

### 3. Provision Networking

Initialize, format, validate, plan, review, and apply the networking
configuration.

### 4. Provision the EKS Cluster

Use the network outputs to configure the cluster networking. Review
cluster IAM permissions, endpoint access, and Kubernetes access entries.

### 5. Provision the Managed Node Group

Use the cluster and network outputs to configure the node group.
Review node IAM permissions, subnet placement, scaling, and cost.

### 6. Verify Kubernetes Access

Update kubeconfig for the intended cluster and test access with kubectl.

### 7. Cleanup

Destroy dependent resources in reverse order: node group, EKS cluster,
and networking. Remove the bootstrap backend only after all states
and infrastructure that depend on it have been safely retired.

## Operational Rules

- Review `terraform plan` before every apply.
- Never commit state files or credentials.
- Do not use unrestricted public EKS API access.
- Do not destroy shared or production infrastructure.
- Verify AWS account and region before provisioning or cleanup.
