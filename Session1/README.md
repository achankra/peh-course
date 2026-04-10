# Session 1 — Platform Engineering Fundamentals

**Day 1 | Session 1 of 4**

## Overview

This session answers the "why" before diving into the "how." You'll assess your current platform maturity, identify developer friction points, and understand the design principles that separate a successful IDP from a pile of tools bolted together. Everything in this session runs with Python 3 alone — no cluster needed yet.

## What You'll Learn

- Why platform engineering exists and the problems it solves
- Platform as Product thinking and Conway's Law
- The maturity model: from ad-hoc scripts to self-service platform
- Design principles from *The Platform Engineer's Handbook*
- How to measure developer experience (DevEx) as a baseline

## Tools Required

- Python 3.10+

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Platform maturity assessment (live with audience) |
| [takehome/](takehome/) | Deep analysis: design principles checklist, DevEx survey, friction analyzer, KPI baseline |

## Quick Start

```bash
# Live demo
cd demo
python3 platform-maturity-assessment.py

# Take-home exercises
cd takehome
python3 design-principles-checklist.py
python3 devex-survey.py
python3 friction-analyzer.py
python3 platform-kpi-collector.py
```

## Key Takeaway

You can't improve what you don't measure. The maturity assessment and KPI baseline you establish here become your "before" snapshot — you'll revisit them in Session 9 to prove the platform's value.

[Back to Course Overview](../README.md)
