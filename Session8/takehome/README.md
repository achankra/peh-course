# Session 8 Takehome — Build Your AI Platform Stack

## What to Do After the Session

### 1. Build a Full RAG Pipeline (30 min)
```bash
python3 rag_pipeline.py
```
Note: Requires ANTHROPIC_API_KEY for LLM features.
Without API key, review the architecture and TF-IDF fallback.

### 2. Explore Multi-Agent Orchestration (20 min)
```bash
cat multi_agent_system.py
```
Study the four-agent architecture: Investigation, Classification,
Remediation, Communication.

### 3. Set Up AI Guardrails (15 min)
```bash
python3 ai-guardrails.py
```
Enforce safety boundaries on AI-generated actions.

### 4. Automate a Runbook (20 min)
```bash
python3 runbook-automator.py
```
Convert one of your team's manual runbooks into an AI-assisted script.

### 5. AI-Generated Service Templates (15 min)
```bash
cat backstage-ai-template.yaml
```
Study how AI generates Kubernetes service config from natural language.

### 6. Correlate Your Alerts (15 min)
```bash
python3 alert-correlator.py
```
Feed your real alert data and see how correlation reduces noise.

### 7. Run AI Agent Tests (10 min)
```bash
python3 test-ai-agents.py
```

## Deliverable
- Map your org's team topology (stream-aligned, platform, enabling)
- Identify one runbook to automate with AI
- Document 3 guardrails for any AI platform action
- Write an AI adoption plan: what to add first, what to wait on
