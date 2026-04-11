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
cat catalog-info.yaml

# 2. Review the Backstage config
cat app-config.yaml

# 3. Run the project bootstrapper to create a new service
python3 project-bootstrapper.py

# 4. Explore the generated files
ls -la generated-service/

# 5. Review a Backstage software template
cat backstage-templates/onboard-service/template.yaml

# 6. AI-POWERED: Search platform docs with RAG (no API key needed)
# Runs sample queries automatically and shows retrieved docs with relevance scores
python3 rag-platform-docs.py
```

## Key Concepts
- One command creates: repo structure, Dockerfile, CI/CD, k8s manifests, catalog entry
- AI-powered doc search: new developers find answers instantly instead of asking in Slack
- TF-IDF runs entirely locally — no API key, no cost, instant results
- In production: swap TF-IDF for vector embeddings (Claude) for semantic understanding
