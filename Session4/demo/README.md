# Session 4 Demo — Day 1 Verification

## What You'll Show (5 min)
Run all three test suites to prove the integrated platform works.

## Steps
```bash
# 1. Cluster health
python3 test-cluster-health.py

# 2. Infrastructure (Crossplane resources)
python3 test-infrastructure.py

# 3. Policies (Gatekeeper constraints active)
python3 test-policies.py
```

## Key Talking Points
- Three test suites validate the three pillars: runtime, infra, policy
- In production, these run in CI as platform smoke tests
- If any fail, you know exactly which layer has a problem
