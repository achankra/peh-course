# Session 3 Demo — Self-Service IaC + Shift-Left Policies + AI Templates

## What You'll Show (10 min)
Submit a self-service database claim, catch policy violations with conftest,
and show AI-generated service configuration.

## Steps
```bash
# 1. Show the Crossplane XRD (the "menu" developers see)
cat xrd-postgresql.yaml

# 2. Show the Composition (what platform team wrote behind the scenes)
cat composition-postgresql.yaml

# 3. Submit a database claim (the developer experience)
cat demo-app-database.yaml
kubectl apply -f demo-app-database.yaml

# 4. Show conftest catching a bad manifest
conftest test conftest-tests/test-manifests.yaml -p conftest-tests/

# 5. Show the Rego policy that caught it
cat conftest-tests/policy.rego

# 6. AI-POWERED: Show AI-generated service template
cat backstage-ai-template.yaml
# Walk through how AI generates boilerplate k8s config from a natural language description
```

## Key Talking Points
- Developer submits 10 lines of YAML, platform provisions the database
- conftest catches violations BEFORE code reaches the cluster
- AI templates: developers describe their service in plain English, AI generates the Kubernetes config
- The platform validates AI-generated output with the same policies as human-written code
