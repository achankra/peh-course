# Session 8 Demo — AI-Augmented Platforms (Expanded: 35 min)

## What You'll Show (15 min demo)
This is the capstone AI session. Show the full spectrum of AI platform capabilities.

## Steps
```bash
# 1. Team topology visualization
python3 team-topology-generator.py

# 2. AI-POWERED: RAG document search (no API key)
python3 rag-platform-docs.py
# Try: "How do I create a new service?"
# Try: "What are the RBAC policies?"

# 3. AI-POWERED: Multi-agent incident response
python3 incident-agent.py
# Shows: Triage Agent → Diagnosis Agent → Remediation Agent
# Each agent has a specific role, human-in-the-loop for critical actions

# 4. AI-POWERED: Agent observability metrics
python3 ai-agent-observability.py
# Shows: How to monitor AI agents — latency, confidence, override rates

# 5. Show AI governance alerts
cat ai-governance-alerts.yaml
# Prometheus alerts for: confidence drops, high override rates, latency spikes
```

## Key Talking Points
- Team Topologies: your platform mirrors your org structure (Conway's Law)
- RAG: AI searches your platform docs — no more stale wikis
- Multi-agent: specialized agents for triage, diagnosis, remediation
- Human-in-the-loop: AI suggests, humans approve critical actions
- Observability for AI: you need to monitor AI agents just like you monitor services
- Governance alerts: automated warnings when AI confidence drops or override rates spike
