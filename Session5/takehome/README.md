# Session 5 Takehome — Build Your Onboarding Pipeline

## What to Do After the Session

### 1. Explore the Order Service Starter Kit (20 min)
```bash
ls -R order-service/
cat order-service/src/index.ts
cat order-service/catalog-info.yaml
cat order-service/.github/workflows/ci.yml
```
This is a complete golden path example. Study how everything connects.

### 2. Run the Onboarding API (15 min)
```bash
python3 onboarding-api.py
```
Creates namespace, RBAC, quota, and registers team in the portal.

### 3. Study the Template System (15 min)
```bash
ls onboarding-templates/
cat onboarding-templates/namespace-template.yaml
cat onboarding-templates/resource-quota.yaml
cat onboarding-templates/team-rbac.yaml
```

### 4. Validate the Workflow (10 min)
```bash
python3 validate-workflow.py
python3 test-onboarding.py
```

## Deliverable
- Customize project-bootstrapper.py for your org's service structure
- Create a catalog-info.yaml for one of your existing services
- Document your ideal onboarding flow (current vs. target)
