# Session 5 Takehome — Build Your Onboarding Pipeline

## Dependencies — Run This First
```bash
pip3 install flask scikit-learn pyyaml --break-system-packages
```
Requires a running Kind cluster from Session 2 (for onboarding-api.py to create namespaces).

## What to Do After the Session

### 1. Explore the Order Service Starter Kit (20 min)

A complete golden path example — a production-ready service template with source code, catalog entry, and CI/CD.
Study how the pieces connect: application code, Backstage registration, and automated pipeline.
```bash
ls -R order-service/
cat order-service/src/index.ts
cat order-service/catalog-info.yaml
cat order-service/.github/workflows/ci.yml
```
This is what every new service at your org should look like on day one.

### 2. Run the Onboarding API (15 min)

A Flask REST API that automates the full team onboarding workflow.
One API call creates a namespace, applies RBAC, sets resource quotas, and registers the team in the portal.
```bash
python3 onboarding-api.py
```
The server starts on localhost. Use curl or a browser to test the /onboard endpoint.
All operations are idempotent and audited — safe to run multiple times.

### 3. Study the Template System (15 min)

Review the YAML templates that the onboarding API uses behind the scenes.
Each template handles one piece of the provisioning: namespace, quotas, and RBAC.
```bash
ls onboarding-templates/
cat onboarding-templates/namespace-template.yaml
cat onboarding-templates/resource-quota.yaml
cat onboarding-templates/team-rbac.yaml
```
These templates are parameterized — the API fills in team name, environment, and resource limits at runtime.

### 4. Validate the Workflow (10 min)

Validate that the complete starter kit workflow is correctly structured and all files are present.
```bash
python3 validate-workflow.py
```
Results show pass/fail for each workflow step (clone, build, test, deploy).

Run the onboarding test suite to verify the API endpoints, bootstrapper, and template system work correctly.
```bash
python3 test-onboarding.py
```
All tests should pass if the onboarding files are correctly structured.

## Deliverable
- Customize project-bootstrapper.py for your org's service structure
- Create a catalog-info.yaml for one of your existing services
- Document your ideal onboarding flow (current vs. target)
- Run [Portal IQ](https://portal-iq.platformetrics.com/) against your org's requirements and document your portal recommendation (build vs. buy)
