# Session 5 Demo — Self-Service Developer Experience + AI Doc Search

## What You'll Show (10 min)
Scaffold a new service, show developer portal integration, and demonstrate
AI-powered documentation search.

## Steps
```bash
# 1. Show what a catalog entity looks like
cat catalog-info.yaml

# 2. Show the Backstage config
cat app-config.yaml

# 3. Run the project bootstrapper to create a new service
python3 project-bootstrapper.py

# 4. Show the generated files
ls -la generated-service/

# 5. Show a Backstage software template
cat backstage-templates/onboard-service/template.yaml

# 6. AI-POWERED: Search platform docs with RAG (no API key needed)
python3 rag-platform-docs.py
# Try: "How do I create a new service?"
# Try: "What are the backup policies?"
# Try: "How do I set up monitoring?"
```

## Key Talking Points
- One command creates: repo structure, Dockerfile, CI/CD, k8s manifests, catalog entry
- AI-powered doc search: new developers find answers instantly instead of asking in Slack
- TF-IDF runs entirely locally — no API key, no cost, instant results
- In production: swap TF-IDF for vector embeddings (Claude) for semantic understanding
