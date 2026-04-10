# Session 3 Takehome — CI/CD Pipelines & Policy Authoring

## What to Do After the Session

### 1. Study the CI/CD Pipeline Architecture (20 min)
```bash
cat backend-pipeline.yml          # Orchestration workflow
cat reusable-workflows/build-and-test.yaml
cat reusable-workflows/security-scan.yaml
cat reusable-workflows/deploy.yaml
```
Map how these workflows chain together via workflow_call.

### 2. Write Your Own Conftest Policy (20 min)
Study `deny-privileged-containers.yaml` and `require-tests-passed.rego`.
Write a new policy that enforces a label (e.g., `team` must be present).
Test it: `conftest test your-manifest.yaml -p your-policy/`

### 3. Set Up Pre-Commit Hooks (10 min)
```bash
cat .pre-commit-config.yaml
pip3 install pre-commit --break-system-packages
pre-commit install
```

### 4. Explore Guardrails (15 min)
```bash
python3 guardrail-validator.py
python3 test-infrastructure.py
```

## Deliverable
- A custom Rego policy that enforces one of your org's rules
- Pre-commit hooks configured to run conftest on every commit
