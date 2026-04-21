#!/usr/bin/env bash
# =================================================================
# Session 7 Demo — Chaos Engineering, Progressive Delivery + AI Runbooks
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session7"

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

# Docker check — Chaos Mesh requires a running cluster
if ! docker info &>/dev/null; then
    echo "  [MISSING] Docker daemon is not running!"
    echo "  Chaos Mesh requires a running cluster. Please start Docker Desktop and re-run this script."
    echo ""
    read -p "Press Enter to exit..."
    exit 1
else
    echo "  [OK] Docker daemon"
fi

if ! check_command "kubectl" "Kubernetes CLI (recommended)"; then
    echo "  Install: https://kubernetes.io/docs/tasks/tools/install-kubectl/"
    echo "  (Can demonstrate concepts without cluster)"
fi
install_pip_package "pyyaml" "yaml"

# Auto-install Chaos Mesh if namespace missing
if command -v kubectl &>/dev/null && command -v helm &>/dev/null; then
    if ! kubectl get ns chaos-mesh &>/dev/null; then
        echo ""
        echo "--- Installing Chaos Mesh ---"
        helm repo add chaos-mesh https://charts.chaos-mesh.org 2>/dev/null || true
        helm repo update chaos-mesh 2>/dev/null || true
        helm install chaos-mesh chaos-mesh/chaos-mesh -n chaos-mesh --create-namespace --set chaosDaemon.runtime=containerd --set chaosDaemon.socketPath=/run/containerd/containerd.sock --wait --timeout 180s
        echo "  [OK] Chaos Mesh installed"
    else
        echo "  [OK] Chaos Mesh namespace exists"
    fi
fi
echo ""

echo "================================================================="
echo "  SESSION 7 DEMO — Chaos, Progressive Delivery & AI Runbooks"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: Chaos experiment definition
echo "=== Step 1: Chaos Experiment Definition ==="
echo ""
echo "Injecting 100ms network latency into api-service pods:"
echo "---"
cat chaos-network-delay.yaml
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 2: Apply chaos experiment
echo ""
echo "=== Step 2: Apply Chaos Experiment ==="
echo ""
kubectl apply -f chaos-network-delay.yaml 2>/dev/null || echo "(Requires Chaos Mesh installed in cluster)"
echo ""
read -p "Press Enter to continue..."

# Step 3: Chaos runner
echo ""
echo "=== Step 3: Chaos Runner (Monitor) ==="
echo ""
python3 chaos-runner.py --dry-run --experiment chaos-network-delay.yaml 2>/dev/null || echo "(Showing chaos runner in dry-run mode)"
echo ""
read -p "Press Enter to continue..."

# Step 4: Canary deployment
echo ""
echo "=== Step 4: Canary Deployment ==="
echo ""
echo "---"
cat canary-deployment.yaml
echo "---"
echo ""
kubectl apply -f canary-deployment.yaml 2>/dev/null || echo "(Requires cluster connection)"
echo ""
read -p "Press Enter to continue..."

# Step 5: Rollback controller
echo ""
echo "=== Step 5: Automated Rollback Controller ==="
echo ""
python3 rollback-controller.py || true
echo ""
read -p "Press Enter to continue..."

# Step 6: AI runbook automator
echo ""
echo "=== Step 6: AI-Powered Runbook Automation ==="
echo ""
echo "Converting a markdown runbook to executable steps:"
echo ""
python3 runbook-automator.py

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "  1. Run more chaos experiments:"
echo "     kubectl apply -f $CODE_DIR/takehome/chaos-experiment-pod-kill.yaml"
echo "     kubectl apply -f $CODE_DIR/takehome/chaos-mesh-pod-failure.yaml"
echo ""
echo "  2. Try blue-green deployment:"
echo "     kubectl apply -f $CODE_DIR/takehome/blue-green-deployment.yaml"
echo ""
echo "  3. Set up Velero backup:"
echo "     kubectl apply -f $CODE_DIR/takehome/velero-storage-location.yaml"
echo "     kubectl apply -f $CODE_DIR/takehome/velero-schedule.yaml"
echo "     python3 $CODE_DIR/takehome/backup-automation.py"
echo ""
echo "  4. Validate backups:"
echo "     bash $CODE_DIR/takehome/restore-validation.sh"
echo ""
echo "  5. Study security scanning:"
echo "     cat $CODE_DIR/takehome/security-scan.yaml"
echo ""
echo "  6. Run resilience tests:"
echo "     python3 $CODE_DIR/takehome/test-resilience.py"
echo ""
echo "Deliverable: One chaos experiment run + Velero backup configured + production readiness checklist."
echo "================================================================="
