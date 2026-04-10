# Session 7 Demo — Chaos Engineering, Progressive Delivery + AI Runbooks

## What You'll Show (10 min)
Inject network latency with Chaos Mesh, deploy a canary with automated rollback,
and show AI-powered runbook automation.

## Steps
```bash
# 1. Show the chaos experiment definition
cat chaos-network-delay.yaml

# 2. Apply it (adds 100ms latency to api-service pods)
kubectl apply -f chaos-network-delay.yaml

# 3. Run the chaos orchestrator to monitor
python3 chaos-runner.py

# 4. Show a canary deployment
kubectl apply -f canary-deployment.yaml

# 5. Show automated rollback
python3 rollback-controller.py

# 6. AI-POWERED: Convert a markdown runbook to executable steps
python3 runbook-automator.py
# Shows: parses runbook → diagnostic steps → action steps → approval gates
# AI adds safety checks automatically
```

## Key Talking Points
- Chaos experiments discover how your system breaks before users do
- Canary + rollback controller = automated safe deployments
- AI runbook automation: takes your existing markdown runbooks and makes them executable
- Safety built in: AI identifies which steps need human approval vs. auto-execute
- This is NOT replacing SREs — it's giving them a co-pilot
