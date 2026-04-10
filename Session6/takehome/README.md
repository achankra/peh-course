# Session 6 Takehome — Full Observability, Cost & AI Stack

## What to Do After the Session

### 1. Instrument an Application (20 min)
```bash
python3 instrument-app.py
```
Add OpenTelemetry tracing to a sample application.

### 2. Configure Alerting (15 min)
```bash
cat alert-rules.yaml
kubectl apply -f alert-rules.yaml
```

### 3. Deploy HPA and VPA (15 min)
```bash
kubectl apply -f checkout-api-hpa.yaml
kubectl apply -f checkout-api-vpa.yaml
```

### 4. Set Up Cost Monitoring (15 min)
```bash
python3 cost-allocation-labels.py
python3 cost-anomaly-detector.py
```

### 5. Map Observability Personas (10 min)
```bash
python3 observability-personas.py
```

### 6. Explore AI Agent Observability (15 min)
```bash
python3 ai-agent-observability.py
```
Study how to monitor AI agents in production: latency, confidence,
human override rates, error tracking.

## Deliverable
- An SLO definition for one of your real services
- HPA configured for your most variable workload
- A plan for how you'd integrate alert correlation into your on-call workflow
