# Session 8 — AI-Augmented Platforms

**Day 2 | Session 4 of 5**

## Overview

The capstone AI session. This is where every AI thread from earlier sessions comes together into a full AI-augmented platform stack. You'll run multi-agent incident response (triage, diagnosis, remediation agents working together), set up AI governance with Prometheus alerts for confidence drops and override rate spikes, and see how to monitor AI agents with the same rigor you monitor production services.

## What You'll Learn

- Team Topologies visualization (Conway's Law in practice)
- RAG pipeline: TF-IDF locally, Claude for semantic search (optional)
- Multi-agent incident response: Triage Agent, Diagnosis Agent, Remediation Agent
- Human-in-the-loop: AI suggests, humans approve critical actions
- AI agent observability: latency, confidence, override rates, error tracking
- AI governance alerts with Prometheus
- AI guardrails and safety boundaries
- Model Context Protocol (MCP) for AI-platform integration

## Tools Required

- Python 3, scikit-learn, pyyaml
- Optional: `ANTHROPIC_API_KEY` for Claude-powered LLM features

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Team topology generator, RAG doc search, multi-agent incident response, AI agent observability, governance alerts |
| [takehome/](takehome/) | Full RAG pipeline, multi-agent system, AI guardrails, runbook automation, AI templates, alert correlation, agent tests |

## Quick Start

```bash
# Live demo
cd demo
python3 team-topology-generator.py
python3 rag-platform-docs.py
python3 incident-agent.py
python3 ai-agent-observability.py
cat ai-governance-alerts.yaml

# Take-home exercises
cd takehome
python3 ai-guardrails.py
python3 multi_agent_system.py
python3 alert-correlator.py
python3 test-ai-agents.py
```

## Key Takeaway

AI on a platform needs the same operational rigor as any production service: observability, governance alerts, guardrails, and human-in-the-loop for critical actions. Start with local heuristics (TF-IDF, rule-based agents), add LLMs when you've proven the workflow.

[Back to Course Overview](../README.md)
