#!/usr/bin/env bash
# =================================================================
# Session 4 Demo — Day 1 Integration & Verification
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session4"

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

# Docker check — cluster required for integration tests
if ! docker info &>/dev/null; then
    echo "  [MISSING] Docker daemon is not running!"
    echo "  Session 4 validates cluster state. Please start Docker Desktop and re-run this script."
    echo ""
    read -p "Press Enter to exit..."
    exit 1
else
    echo "  [OK] Docker daemon"
fi

if ! check_command "kubectl" "Kubernetes CLI (recommended)"; then
    echo "  Install: https://kubernetes.io/docs/tasks/tools/install-kubectl/"
    echo "  (Can demonstrate test patterns without cluster, but cluster recommended)"
fi

# Ensure Kind cluster and team namespaces from Session 2 exist
if command -v kind &>/dev/null; then
    if ! kind get clusters 2>/dev/null | grep -q "^workshop$"; then
        echo ""
        echo "--- Creating Kind cluster 'workshop' (from Session 2) ---"
        kind create cluster --name workshop --wait 60s
        echo "  [OK] Kind cluster 'workshop' created"
    else
        echo "  [OK] Kind cluster 'workshop' exists"
    fi
fi
if command -v kubectl &>/dev/null; then
    if ! kubectl get ns team-alpha &>/dev/null 2>&1; then
        echo "  Creating team namespaces (from Session 2)..."
        kubectl create ns team-alpha 2>/dev/null || true
        kubectl create ns team-beta 2>/dev/null || true
        echo "  [OK] Team namespaces created"
    else
        echo "  [OK] Team namespaces exist"
    fi
fi
echo ""

echo "================================================================="
echo "  SESSION 4 DEMO — Day 1 Integration Verification"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: Cluster health
echo "=== Step 1: Cluster Health Tests ==="
echo ""
python3 test-cluster-health.py || true
echo ""
read -p "Press Enter to continue..."

# Step 2: Infrastructure tests
echo ""
echo "=== Step 2: Infrastructure Tests (Crossplane) ==="
echo ""
python3 test-infrastructure.py || true
echo ""
read -p "Press Enter to continue..."

# Step 3: Policy tests
echo ""
echo "=== Step 3: Policy Tests (Gatekeeper) ==="
echo ""
python3 test-policies.py || true

echo ""
echo "=== Demo Complete ==="
echo ""
echo "Three test suites validate the three pillars: runtime, infra, policy."
echo "In production, these run in CI as platform smoke tests."
echo ""
echo "================================================================="
echo "  TAKEHOME — PREPARE FOR DAY 2"
echo "================================================================="
echo ""
echo "  1. Verify your cluster is still running:"
echo "     kubectl get ns"
echo "     kubectl get pods --all-namespaces"
echo ""
echo "  2. Review your notes:"
echo "     - What were the 3 most surprising things you learned?"
echo "     - Which component would you implement first at your org?"
echo ""
echo "  3. Prepare for Day 2:"
echo "     - How do new developers onboard at your company today?"
echo "     - How long from new hire to first deployment?"
echo "     - What documentation exists? Is it up to date?"
echo ""
echo "Day 2 starts with Developer Experience (Session 5)."
echo "================================================================="
