# Session 3 — IaC, Policy & CI/CD

**Day 1 | Session 3 of 4**

## Overview

Self-service infrastructure meets shift-left security. You'll set up Crossplane so developers can provision databases with a 10-line YAML claim, write OPA/Rego policies that catch violations before code reaches the cluster, and see how AI can generate Kubernetes configuration from natural-language descriptions — with the same policy engine validating the output.

## What You'll Learn

- Crossplane XRDs, Compositions, and Claims for self-service infra
- Policy-as-Code with OPA, Conftest, and Gatekeeper
- Writing Rego policies and testing with conftest
- AI-generated service templates with policy validation
- CI/CD pipeline architecture with GitHub Actions reusable workflows
- Pre-commit hooks for shift-left validation

## Tools Required

- kubectl, Helm (for Crossplane), conftest, Python 3

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Crossplane XRD + Composition, database claim, conftest policies, AI Backstage template |
| [takehome/](takehome/) | GitHub Actions pipelines, Rego policy authoring, pre-commit hooks, guardrail validator |

## Quick Start

```bash
# Live demo
cd demo
kubectl apply -f crossplane-providers.yaml
kubectl apply -f xrd-postgresql.yaml
kubectl apply -f composition-postgresql.yaml
kubectl apply -f demo-app-database.yaml
conftest test conftest-tests/test-manifests.yaml -p conftest-tests/

# Take-home exercises
cd takehome
python3 guardrail-validator.py
python3 test-infrastructure.py
```

## Key Takeaway

Developers submit 10 lines of YAML, the platform provisions the database. Conftest catches violations before code reaches the cluster. AI generates config, but it passes through the same policy gate as human-written code.

[Back to Course Overview](../README.md)
