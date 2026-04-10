# Session 5 — Developer Experience & Self-Service

**Day 2 | Session 1 of 5**

## Overview

Day 2 opens with the developer's perspective. You'll scaffold a complete service from a single command, explore Backstage software templates and service catalogs, and see AI-powered documentation search (RAG) running entirely locally with TF-IDF — no API key needed. The goal: a new developer goes from zero to first deployment in under an hour.

## What You'll Learn

- Backstage developer portal: catalog entities, software templates, app-config
- Golden path service scaffolding (repo structure, Dockerfile, CI/CD, k8s manifests, catalog entry)
- AI-powered platform doc search using RAG with TF-IDF
- Team onboarding automation (namespace + RBAC + quota + portal registration)
- Starter kit template architecture

## Tools Required

- Python 3, pip3 (scikit-learn for TF-IDF), Node.js (optional, for Backstage local)

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Backstage config, catalog entities, project bootstrapper, RAG doc search |
| [takehome/](takehome/) | Full onboarding API, order-service starter kit, template system, validation scripts |

## Quick Start

```bash
# Live demo
cd demo
python3 project-bootstrapper.py
python3 rag-platform-docs.py

# Take-home exercises
cd takehome
python3 onboarding-api.py
python3 validate-workflow.py
python3 test-onboarding.py
```

## Key Takeaway

One command creates everything a developer needs to ship. AI doc search means new developers find answers instantly instead of asking in Slack. TF-IDF runs locally; swap for Claude embeddings when ready for semantic search.

[Back to Course Overview](../README.md)
