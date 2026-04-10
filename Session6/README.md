# Session 6 — Observability, SLOs & Cost Management

**Day 2 | Session 2 of 5**

## Overview

You can't run a platform blind. This session deploys the OpenTelemetry Collector as the single entry point for all telemetry, defines SLOs with Sloth that generate Prometheus recording rules, sets up cost visibility with OpenCost, and demonstrates AI-powered alert correlation that reduces 50 noisy alerts down to 3 root-cause incidents.

## What You'll Learn

- OpenTelemetry Collector: receivers, processors, exporters
- SLO definitions with Sloth (YAML to Prometheus rules)
- Cost allocation, anomaly detection, and per-team showback
- AI alert correlation: grouping related alerts into root-cause incidents
- HPA / VPA for autoscaling
- Observability personas (developer, SRE, platform, leadership)

## Tools Required

- kubectl, Helm (Prometheus stack), Python 3

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | OTel Collector config + deployment, Sloth SLO definition, cost analyzer, AI alert correlator |
| [takehome/](takehome/) | App instrumentation, alert rules, HPA/VPA, cost monitoring, AI agent observability, persona mapping |

## Quick Start

```bash
# Live demo
cd demo
kubectl apply -f otel-collector-deployment.yaml
cat sloth-auth-service-slo.yaml
python3 cost-analyzer.py
python3 alert-correlator.py

# Take-home exercises
cd takehome
python3 instrument-app.py
kubectl apply -f checkout-api-hpa.yaml
python3 cost-anomaly-detector.py
python3 ai-agent-observability.py
```

## Key Takeaway

Cost visibility is a platform responsibility, not an afterthought. AI alert correlation reduces alert fatigue by grouping related signals automatically — runs locally with heuristics, optionally add an LLM for advanced pattern recognition.

[Back to Course Overview](../README.md)
