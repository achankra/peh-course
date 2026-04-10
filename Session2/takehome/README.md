# Session 2 Takehome — Build Your Control Plane

## What to Do After the Session

### 1. Set Up Your Own Kind Cluster (10 min)
```bash
kind create cluster --name my-platform
```

### 2. Create Multi-Environment Config (15 min)
Review and customize `multi-env-config.yaml` for your environments.
```bash
cat multi-env-config.yaml
```

### 3. Apply Developer RBAC (10 min)
```bash
kubectl apply -f rbac-developer-role.yaml
kubectl apply -f service-account.yaml
```

### 4. Deploy a Test Application (10 min)
```bash
kubectl apply -f demo-app-deployment.yaml
```

### 5. Run Validation Tests (10 min)
```bash
python3 test-rbac-permissions.py
python3 test-cluster-health.py
```

## Deliverable
A running Kind cluster with:
- 2+ team namespaces with resource quotas
- Developer RBAC roles applied
- A test application deployed
- All health checks passing
