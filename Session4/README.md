# Session 4 — Day 1 Integration & Synthesis

**Day 1 | Session 4 of 4**

## Overview

Day 1 wraps up by proving everything works together. Three test suites validate the three pillars you've built: runtime (cluster health), infrastructure (Crossplane resources), and policy (Gatekeeper constraints). This is the integration checkpoint — if all tests pass, your platform foundation is solid.

## What You'll Learn

- End-to-end platform verification patterns
- Three-pillar testing: runtime, infrastructure, policy
- How platform teams use smoke tests in CI
- Debugging cross-layer issues

## Tools Required

- kubectl, Python 3 (same setup from Sessions 2-3)

## Contents

| Folder | What's Inside |
|---|---|
| [demo/](demo/) | Three validation test suites: cluster health, infrastructure, policies |
| [takehome/](takehome/) | Consolidation guide: review notes, identify first component to implement, prepare for Day 2 |

## Quick Start

```bash
cd demo
python3 test-cluster-health.py
python3 test-infrastructure.py
python3 test-policies.py
```

## Key Takeaway

If any test fails, you know exactly which layer has a problem. In production, these same tests run in CI as platform smoke tests after every change.

[Back to Course Overview](../README.md)
