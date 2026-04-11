# Session 8 — AI-Augmented Platforms

**Day 2 | Session 4 of 5**

## Overview

The capstone AI session. This is where every AI thread from earlier sessions comes together. You'll run multi-agent incident response (triage, diagnosis, remediation agents working together), search platform documentation with RAG (no API key needed), set up AI governance with Prometheus alerts for confidence drops and override rate spikes, and see how to monitor AI agents with the same rigor you monitor production services.

## What You'll Learn

- RAG pipeline: TF-IDF locally, Claude for semantic search (optional)
- Multi-agent incident response: Triage Agent, Diagnosis Agent, Remediation Agent
- Human-in-the-loop: AI suggests, humans approve critical actions
- AI agent observability: latency, confidence, override rates, error tracking
- AI governance alerts with Prometheus
- AI guardrails and safety boundaries
- Model Context Protocol (MCP) for AI-platform integration

## Knowledge Prerequisites

- Everything from Sessions 1-7
- Basic understanding of what LLMs are and how they generate text
- Know what RAG (Retrieval-Augmented Generation) means at a high level: search docs, feed context to AI
- Understand the concept of AI agents (autonomous components that take actions)
- Familiarity with why AI governance matters (confidence thresholds, human-in-the-loop, guardrails)

## Tools Required

- Python 3, scikit-learn, pyyaml
- Optional: `ANTHROPIC_API_KEY` for Claude-powered LLM features

## Verify Your Setup

```bash
python3 verify_module.py
```

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | RAG doc search, multi-agent incident response, AI agent observability, governance alerts |
| [takehome/](takehome/) | Full RAG pipeline, multi-agent system, AI guardrails, runbook automation, AI templates, alert correlation, agent tests |

## Quick Start

```bash
# Demo
cd demo
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

## Go Deeper

This session covers Chapter 13 of [*The Platform Engineer's Handbook*](https://peh-packt.platformetrics.com/), which goes further into production AI/ML platform patterns, advanced RAG architectures, and enterprise-grade AI governance. See the [book repo](https://github.com/achankra/peh) for the full code samples.

[Back to Course Overview](../README.md)
