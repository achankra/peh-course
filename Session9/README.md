# Session 9 — Team Topologies, Synthesis & Next Steps

**Day 2 | Session 5 of 5**

## Overview

The final session brings everything together. You'll map your organization into Team Topologies (stream-aligned, platform, enabling, complicated-subsystem), collect DORA metrics as your post-workshop KPI baseline, and measure AI impact in business terms. This is where you build the 30/60/90-day plan you'll take back to your team.

## What You'll Learn

- Conway's Law: your platform will mirror your org structure — design both intentionally
- Team Topologies: four team types and three interaction modes
- DORA metrics: deployment frequency, lead time, MTTR, change failure rate
- AI impact measurement: hours saved, incidents resolved faster, cost avoided
- Building a 30/60/90-day platform adoption roadmap
- Presenting platform ROI to leadership

## Knowledge Prerequisites

- Everything from Sessions 1-8
- Understand Conway's Law (system design mirrors org communication structure)
- Know what Team Topologies are (stream-aligned, platform, enabling, complicated-subsystem)
- Familiar with DORA metrics as the industry standard for engineering productivity
- Comfortable presenting technical value in business terms (hours saved, cost reduced)

## Tools Required

- Python 3, pyyaml, scikit-learn (same setup from previous sessions)

## Verify Your Setup

```bash
python3 verify_module.py
```

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Team topology generator, platform KPI collector, AI impact measurement |
| [takehome/](takehome/) | Maturity re-assessment, cost baseline, friction re-analysis, 30/60/90-day roadmap |

## Quick Start

```bash
# Demo
cd demo

# Map your org into Team Topologies types and visualize interaction modes
python3 team-topology-generator.py

# Collect DORA metrics: deployment frequency, lead time, MTTR, change failure rate
python3 platform-kpi-collector.py

# Quantify AI impact in business terms: hours saved, incidents resolved faster
python3 measure-ai-impact.py

# Take-home exercises
cd takehome

# Re-run the maturity assessment — compare with your Day 1 score
python3 platform-maturity-assessment.py

# Capture cost baseline for 30/60/90-day tracking
python3 cost-analyzer.py

# Re-analyze friction points — has your understanding of bottlenecks evolved?
python3 friction-analyzer.py --workflow onboarding
```

## Key Takeaway

Measure before you build, measure after you ship, and present in business terms. The maturity assessment, DORA metrics, and AI impact numbers are your ammunition for getting leadership buy-in. Re-run at 30/60/90 days to prove the platform's value.

## Go Deeper

This session covers Chapter 14 of [*The Platform Engineer's Handbook*](https://peh-packt.platformetrics.com/), which goes further into organizational design for platform teams, advanced adoption strategies, and measuring platform engineering ROI at scale. See the [book repo](https://github.com/achankra/peh) for the full code samples.

[Back to Course Overview](../README.md)
