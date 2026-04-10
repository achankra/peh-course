# Session 7 Takehome — Full Resilience Suite

## What to Do After the Session

### 1. Run More Chaos Experiments (20 min)
```bash
kubectl apply -f chaos-experiment-pod-kill.yaml
kubectl apply -f chaos-mesh-pod-failure.yaml
```
Observe recovery time. Does your service self-heal?

### 2. Try Blue-Green Deployment (15 min)
```bash
cat blue-green-deployment.yaml
kubectl apply -f blue-green-deployment.yaml
```
Compare the blue-green approach with canary.

### 3. Set Up Velero Backup (20 min)
```bash
kubectl apply -f velero-storage-location.yaml
kubectl apply -f velero-schedule.yaml
python3 backup-automation.py
```

### 4. Validate Backups (10 min)
```bash
bash restore-validation.sh
```

### 5. Add Security Scanning to CI (10 min)
```bash
cat security-scan.yaml
```
Study the reusable security scanning workflow.

### 6. Run Resilience Tests (10 min)
```bash
python3 test-resilience.py
```

## Deliverable
- One chaos experiment run against your test cluster with documented observations
- Velero backup schedule configured
- A production readiness checklist for one of your services
