# Session 9 — Team Topologies, Synthesis & Next Steps

**Day 2 | Session 5 of 5**

## Overview

The final session steps back from tools to look at the organizational layer. You'll visualize your team topology using Conway's Law to understand how your platform structure mirrors (or should mirror) your org structure, then measure the platform's value using DORA metrics and KPI collectors, assess AI feature impact, and build your personal 30/60/90-day adoption roadmap. The goal: you leave with a clear picture of both the technical and organizational work ahead.

## What You'll Learn

- Conway's Law: why your platform mirrors your org structure
- Team Topologies: stream-aligned, platform, enabling, and complicated-subsystem teams
- Interaction modes: collaboration, X-as-a-Service, facilitating
- Measuring platform value: DORA metrics, deployment frequency, lead time, MTTR
- Presenting to leadership in business terms (hours saved, cost reduced)
- AI impact measurement: before/after comparison
- Value Stream Mapping and friction analysis
- Building a 30/60/90-day platform adoption roadmap
- Platform maturity re-assessment (compare with Session 1 baseline)

## Knowledge Prerequisites

- Everything from Sessions 1-8
- Understand Conway's Law ("organizations design systems that mirror their communication structure")
- Know what Team Topologies is (a framework for organizing engineering teams)
- Familiarity with DORA metrics (deployment frequency, lead time, MTTR, change failure rate)
- Understanding of how to communicate platform value to leadership (ROI, business outcomes)

## Tools Required

- Python 3 (same setup from earlier sessions)

## Verify Your Setup

```bash
python3 verify_module.py
```

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Team topology generator, platform KPI collector, AI impact measurement |
| [takehome/](takehome/) | Team topology mapping, cost analyzer, friction analyzer, maturity re-assessment, 30/60/90-day roadmap |

## Quick Start

```bash
# Demo
cd demo
python3 team-topology-generator.py
python3 platform-kpi-collector.py
python3 measure-ai-impact.py

# Take-home exercises
cd takehome
python3 platform-maturity-assessment.py
python3 cost-analyzer.py
python3 friction-analyzer.py
```

## Key Takeaway

Tools alone don't make a platform successful — organizational design matters just as much. Map your team topology, measure before you build, measure as you go, and present to leadership in business outcomes. Re-run the maturity assessment from Session 1 — your understanding of what "good" looks like has fundamentally changed.

## Go Deeper

This session covers Chapter 14 of [*The Platform Engineer's Handbook*](https://peh-packt.platformetrics.com/), which goes further into Team Topologies in depth, platform adoption strategies, organizational change management, and scaling platform teams. See the [book repo](https://github.com/achankra/peh) for the full code samples.

[Back to Course Overview](../README.md)
