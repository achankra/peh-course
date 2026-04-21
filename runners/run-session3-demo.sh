#!/usr/bin/env bash
# =================================================================
# Session 3 Demo — Self-Service IaC + Shift-Left Policies + AI Templates
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session3"

# -----------------------------------------------------------------
# Dependency check & install
# -----------------------------------------------------------------
check_command() {
    if ! command -v "$1" &>/dev/null; then
        echo "  [MISSING] $1 — $2"
        return 1
    else
        echo "  [OK] $1"
        return 0
    fi
}

install_pip_package() {
    python3 -c "import $2" 2>/dev/null || {
        echo "  Installing $1..."
        pip3 install "$1" --break-system-packages --quiet 2>/dev/null || pip3 install "$1" --quiet
    }
}

echo "--- Checking dependencies ---"
check_command "python3" "Python 3 runtime (required)"

# Docker check — cluster components require Docker
if ! docker info &>/dev/null; then
    echo "  [MISSING] Docker daemon is not running!"
    echo "  Crossplane requires a running cluster. Please start Docker Desktop and re-run this script."
    echo ""
    read -p "Press Enter to exit..."
    exit 1
else
    echo "  [OK] Docker daemon"
fi

if ! check_command "kubectl" "Kubernetes CLI (recommended)"; then
    echo "  Install: https://kubernetes.io/docs/tasks/tools/install-kubectl/"
    echo "  (Can demonstrate without cluster, but cluster recommended)"
fi
if ! check_command "conftest" "Conftest policy tool (recommended)"; then
    echo "  Install: https://www.conftest.dev/"
    echo "  (Policy demo will show concept if not installed)"
fi
install_pip_package "flask" "flask"
install_pip_package "pyyaml" "yaml"

# Auto-install Crossplane if namespace missing
if command -v kubectl &>/dev/null && command -v helm &>/dev/null; then
    if ! kubectl get ns crossplane-system &>/dev/null; then
        echo ""
        echo "--- Installing Crossplane ---"
        helm repo add crossplane-stable https://charts.crossplane.io/stable 2>/dev/null || true
        helm repo update crossplane-stable 2>/dev/null || true
        helm install crossplane crossplane-stable/crossplane -n crossplane-system --create-namespace --wait --timeout 120s
        echo "  [OK] Crossplane installed"
    else
        echo "  [OK] Crossplane namespace exists"
    fi
fi
echo ""

echo "================================================================="
echo "  SESSION 3 DEMO — Self-Service IaC, Policies & AI Templates"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: Review the Crossplane XRD
echo "=== Step 1: Crossplane XRD (the developer menu) ==="
echo ""
echo "This is what developers see — a simple interface to request infrastructure:"
echo "---"
cat xrd-postgresql.yaml
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 2: Review the Composition
echo ""
echo "=== Step 2: Composition (platform team's implementation) ==="
echo ""
echo "Behind the scenes, the platform team wrote this Composition:"
echo "---"
cat composition-postgresql.yaml
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 3: Submit a database claim
echo ""
echo "=== Step 3: Submit a Database Claim ==="
echo ""
echo "The developer experience — 10 lines of YAML:"
echo "---"
cat demo-app-database.yaml
echo "---"
echo ""
kubectl apply -f demo-app-database.yaml 2>/dev/null || echo "(Crossplane CRDs may not be installed — this is the claim that would be submitted)"
echo ""
read -p "Press Enter to continue..."

# Step 4: Conftest policy enforcement
echo ""
echo "=== Step 4: Policy Enforcement with Conftest ==="
echo ""
if command -v conftest &>/dev/null && [ -d "conftest-tests" ]; then
    conftest test conftest-tests/test-manifests.yaml -p conftest-tests/ || true
else
    echo "(conftest not installed or test files not found — showing the concept)"
    echo "Command: conftest test conftest-tests/test-manifests.yaml -p conftest-tests/"
fi
echo ""
read -p "Press Enter to continue..."

# Step 5: AI-generated service template
echo ""
echo "=== Step 5: AI-Generated Service Template ==="
echo ""
echo "AI generates Kubernetes config from natural language descriptions:"
echo "---"
cat backstage-ai-template.yaml
echo "---"

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "  1. Study the CI/CD Pipeline Architecture:"
echo "     cat $CODE_DIR/takehome/backend-pipeline.yml"
echo "     ls $CODE_DIR/takehome/reusable-workflows/"
echo ""
echo "  2. Write your own Conftest policy"
echo ""
echo "  3. Set up pre-commit hooks:"
echo "     cat $CODE_DIR/takehome/.pre-commit-config.yaml"
echo "     pre-commit install"
echo ""
echo "  4. Explore guardrails:"
echo "     python3 $CODE_DIR/takehome/guardrail-validator.py"
echo "     python3 $CODE_DIR/takehome/test-infrastructure.py"
echo ""
echo "Deliverable: A custom Rego policy + pre-commit hooks configured."
echo "================================================================="
