# Architecture Decision Records

## ADR-001: Use Terraform

**Decision:** Use Terraform to provision and manage AWS infrastructure.

**Reason:** Infrastructure can be reviewed, version-controlled,
recreated, and changed through a consistent workflow.

## ADR-002: Separate Infrastructure Layers

**Decision:** Use separate Terraform root configurations for networking,
the EKS cluster, and managed node groups.

**Reason:** Each layer has a clear responsibility and its own state.
Dependencies will be passed explicitly through outputs and inputs.

**Trade-off:** Separate states require careful dependency management
and ordered deployment and destruction.

## ADR-003: Use EKS Managed Node Groups

**Decision:** Use EKS managed node groups and disable EKS Auto Mode.

**Reason:** This project is intended to teach the conventional EKS
control-plane and worker-node architecture.

## ADR-004: Separate IAM Roles

**Decision:** Use different IAM roles for the EKS cluster and worker nodes.

**Reason:** Cluster and node components have different trust relationships
and permission requirements.

## ADR-005: Use GitHub OIDC

**Decision:** Use GitHub OIDC for GitHub Actions authentication to AWS.

**Reason:** Workflows can obtain temporary credentials without storing
long-lived AWS access keys in GitHub secrets.

## ADR-006: Use Remote Terraform State

**Decision:** Use an encrypted, versioned S3 backend with access controls
and supported state locking.

**Reason:** State must be protected and managed consistently across
local development and automation.

## ADR-007: Require Controlled Applies

**Decision:** Run validation and planning before applying infrastructure.

**Reason:** Changes should be reviewed, and deployment permissions
should be restricted to approved workflows and environments.
