# Session 2 — Infrastructure & Control Plane

**Day 1 | Session 2 of 4**

## Overview

This is where hands meet keyboard. You'll spin up a Kind cluster, provision team namespaces with resource quotas and RBAC, and write your first piece of infrastructure-as-code using Pulumi with the Python SDK. By the end, you have a multi-tenant control plane where each team gets an isolated namespace with guardrails.

## What You'll Learn

- Kubernetes cluster provisioning with Kind
- Infrastructure as Code with Pulumi (Python SDK)
- Namespace isolation with ResourceQuotas and LimitRanges
- Platform-level RBAC (admin vs. developer roles)
- Control plane architecture for multi-tenancy

## Tools Required

- Docker Desktop, Kind, kubectl, Python 3, Pulumi

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Kind cluster setup, Pulumi modules, namespace provisioner, RBAC, platform services |
| [takehome/](takehome/) | Build your own control plane: multi-env config, developer RBAC, test app deployment, validation tests |

## Quick Start

```bash
# Create the cluster
kind create cluster --name workshop

# Live demo
cd demo
pip3 install pulumi pulumi-kubernetes --break-system-packages
python3 namespace-provisioner.py
kubectl apply -f rbac-platform-admin.yaml

# Take-home exercises
cd takehome
kubectl apply -f rbac-developer-role.yaml
kubectl apply -f demo-app-deployment.yaml
python3 test-cluster-health.py
```

## Key Takeaway

One command creates a namespace + quota + limit range + RBAC. Developers never touch cluster-level resources. This is the foundation every subsequent session builds on.

[Back to Course Overview](../README.md)
