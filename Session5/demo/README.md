# Session 5 Demo — Self-Service Developer Experience + AI Doc Search

## Demo Overview
Scaffold a new service, explore developer portal integration, and try
AI-powered documentation search.

## Dependencies — Run This First
```bash
pip3 install scikit-learn pyyaml --break-system-packages
```

## Steps
```bash
# 1. Review what a catalog entity looks like
# This YAML registers a service in Backstage's service catalog with metadata, ownership, and lifecycle info.
cat catalog-info.yaml

# 2. Review the Backstage config
# The app-config defines how Backstage connects to your catalog, templates, and integrations.
cat app-config.yaml

# 3. Run the project bootstrapper to create a new service
# One command generates a complete service scaffold: repo structure, Dockerfile, CI/CD pipeline,
# Kubernetes manifests, and a Backstage catalog entry — everything a developer needs to ship.
python3 project-bootstrapper.py bootstrap platform demo-api python
# Output: a generated-service/ directory with a fully structured project ready to deploy.

# 4. Explore the generated files
# Inspect the scaffolded service to see everything the bootstrapper created.
ls -la generated-service/

# 5. Review a Backstage software template
# Software templates let platform teams define reusable service blueprints.
# Developers fill in a form, the template generates the full project.
cat backstage-templates/onboard-service/template.yaml

# 6. Choosing your portal: build vs. buy
# You've now seen what Backstage looks like hands-on. When you take this back to your org,
# use Portal IQ to evaluate whether Backstage OSS is the right choice for your team,
# or whether a managed solution like Port, Cortex, or Harness IDP is a better fit.
# Run it at: https://portal-iq.platformetrics.com

# 7. AI-POWERED: Search platform docs with RAG (no API key needed)
# Uses TF-IDF to index platform documentation and answer natural language queries.
# Runs sample queries automatically and shows retrieved docs with relevance scores.
python3 rag-platform-docs.py
# Output: query results ranked by relevance. New developers find answers instantly instead of asking in Slack.
```

## Key Concepts
- One command creates: repo structure, Dockerfile, CI/CD, k8s manifests, catalog entry
- AI-powered doc search: new developers find answers instantly instead of asking in Slack
- TF-IDF runs entirely locally — no API key, no cost, instant results
- In production: swap TF-IDF for vector embeddings (Claude) for semantic understanding
