# Session 6 Demo — Observability, SLOs, Cost + AI Alert Correlation

## What You'll Show (10 min)
Deploy OTel collector, show an SLO definition, run cost analysis,
and demonstrate AI-powered alert correlation.

## Steps
```bash
# 1. Show OTel collector config (receivers, processors, exporters)
cat otel-collector-config.yaml

# 2. Deploy the collector
kubectl apply -f otel-collector-deployment.yaml

# 3. Show an SLO definition with Sloth
cat sloth-auth-service-slo.yaml

# 4. Run cost analysis
python3 cost-analyzer.py

# 5. AI-POWERED: Correlate noisy alerts into root causes
python3 alert-correlator.py
# Shows: 50 raw alerts → grouped into 3 incidents with root cause analysis
```

## Key Talking Points
- OTel Collector is the single entry point for all telemetry
- Sloth generates Prometheus recording rules from simple SLO YAML
- Cost visibility is a platform responsibility, not an afterthought
- AI alert correlation: reduces alert fatigue by 80% — groups related alerts automatically
- Runs locally with heuristics; optionally add LLM for advanced pattern recognition
