# Session 2 Demo — Control Plane Walkthrough

## What You'll Show (10 min)
Provision a Kind cluster and create isolated team namespaces with quotas and RBAC.

## Prerequisites
```bash
kind create cluster --name workshop
pip3 install pulumi pulumi-kubernetes --break-system-packages
```

## Steps
```bash
# 1. Show the Pulumi cluster code (walk through __main__.py)
cat pulumi-cluster/__main__.py

# 2. Provision namespaces with quotas
python3 namespace-provisioner.py

# 3. Show what was created
kubectl get ns
kubectl describe resourcequota -n team-alpha

# 4. Apply platform admin RBAC
kubectl apply -f rbac-platform-admin.yaml

# 5. Show the platform services that run in the control plane
cat platform-services.yaml
```

## Key Talking Points
- One command creates namespace + quota + limit range + RBAC
- Developers never touch cluster-level resources
- Resource quotas prevent any team from starving others
