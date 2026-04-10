# Session 7 — Production Readiness, Security & Resilience

**Day 2 | Session 3 of 5**

## Overview

Your platform needs to survive failure. This session injects real faults with Chaos Mesh, deploys services with canary and blue-green strategies that roll back automatically on error, sets up Velero for cluster backup/restore, and shows AI-powered runbook automation that converts your existing markdown runbooks into executable scripts with built-in safety gates.

## What You'll Learn

- Chaos engineering with Chaos Mesh (network delay, pod kill, pod failure)
- Progressive delivery: canary + automated rollback controller
- Blue-green deployment patterns
- Backup and disaster recovery with Velero
- AI runbook automation: markdown runbooks to executable steps
- Security scanning in CI pipelines

## Tools Required

- kubectl, Helm (Chaos Mesh, Velero), Python 3

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Chaos experiments, canary deployment, rollback controller, AI runbook automator |
| [takehome/](takehome/) | Pod kill/failure chaos, blue-green deployment, Velero backup/restore, security scanning, resilience tests |

## Quick Start

```bash
# Live demo
cd demo
kubectl apply -f chaos-network-delay.yaml
python3 chaos-runner.py
kubectl apply -f canary-deployment.yaml
python3 rollback-controller.py
python3 runbook-automator.py

# Take-home exercises
cd takehome
kubectl apply -f chaos-experiment-pod-kill.yaml
kubectl apply -f blue-green-deployment.yaml
kubectl apply -f velero-schedule.yaml
python3 test-resilience.py
```

## Key Takeaway

Chaos experiments discover how your system breaks before users do. AI runbook automation doesn't replace SREs — it gives them a co-pilot that identifies which steps need human approval vs. auto-execute.

[Back to Course Overview](../README.md)
