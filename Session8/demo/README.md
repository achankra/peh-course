# Session 8 Demo — AI-Augmented Platforms

## Demo Overview
The capstone AI session. Explore the full spectrum of AI platform capabilities —
from document search to multi-agent incident response to governance.

## Dependencies — Run This First
```bash
pip3 install scikit-learn pyyaml --break-system-packages
# Optional (for LLM features): export ANTHROPIC_API_KEY=your-key-here
```

## Steps
```bash
# 1. AI-POWERED: RAG document search (no API key)
# Runs sample queries automatically and shows retrieved docs with relevance scores
python3 rag-platform-docs.py

# 2. AI-POWERED: Multi-agent incident response
python3 incident-agent.py
# Triage Agent → Diagnosis Agent → Remediation Agent
# Each agent has a specific role, human-in-the-loop for critical actions

# 3. AI-POWERED: Agent observability metrics
python3 ai-agent-observability.py
# How to monitor AI agents — latency, confidence, override rates

# 4. Review AI governance alerts
cat ai-governance-alerts.yaml
# Prometheus alerts for: confidence drops, high override rates, latency spikes
```

## Key Concepts
- RAG: AI searches your platform docs — no more stale wikis, no API key needed
- Multi-agent: specialized agents for triage, diagnosis, remediation working together
- Human-in-the-loop: AI suggests, humans approve critical actions
- Observability for AI: you need to monitor AI agents just like you monitor services
- Governance alerts: automated warnings when AI confidence drops or override rates spike
- Start local (TF-IDF, heuristics), add LLMs (Claude) when the workflow is proven
