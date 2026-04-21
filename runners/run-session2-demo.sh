#!/usr/bin/env bash
# =================================================================
# Session 2 Demo — Control Plane Walkthrough
# =================================================================
# Run this script to execute the Session 2 live demo.
# Provisions a Kind cluster and creates team namespaces with RBAC.
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session2"

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

# Docker check — Kind requires Docker to be running
if ! docker info &>/dev/null; then
    echo "  [MISSING] Docker daemon is not running!"
    echo "  Kind requires Docker. Please start Docker Desktop and re-run this script."
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
if ! check_command "kind" "Kind cluster tool (recommended)"; then
    echo "  Install: https://kind.sigs.k8s.io/docs/user/quick-start/"
    echo "  (Can demonstrate without cluster, but cluster recommended)"
fi
if ! check_command "pulumi" "Pulumi IaC tool (recommended)"; then
    echo "  Install: https://www.pulumi.com/docs/install/"
    echo "  (Demonstration shows the concept without running)"
fi
install_pip_package "pulumi" "pulumi"
install_pip_package "pulumi-kubernetes" "pulumi_kubernetes"
install_pip_package "pyyaml" "yaml"

# Auto-create Kind cluster if missing
if command -v kind &>/dev/null; then
    if ! kind get clusters 2>/dev/null | grep -q "^workshop$"; then
        echo ""
        echo "--- Creating Kind cluster 'workshop' ---"
        kind create cluster --name workshop --wait 60s
        echo "  [OK] Kind cluster 'workshop' created"
    else
        echo "  [OK] Kind cluster 'workshop' exists"
    fi
fi
echo ""

echo "================================================================="
echo "  SESSION 2 DEMO — Control Plane Walkthrough"
echo "================================================================="
echo ""

# Verify setup
echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: Review the Pulumi cluster code
echo "=== Step 1: Review the Pulumi Cluster Code ==="
echo ""
echo "This is the IaC that defines our cluster structure:"
echo "---"
cat pulumi-cluster/__main__.py
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 2: Provision team namespaces with quotas
echo ""
echo "=== Step 2: Provision Team Namespaces ==="
echo ""
python3 namespace-provisioner.py --namespace team-alpha --env dev --team alpha
echo ""
python3 namespace-provisioner.py --namespace team-beta --env dev --team beta
echo ""
read -p "Press Enter to continue..."

# Step 3: Verify what was created
echo ""
echo "=== Step 3: Verify Namespaces and Quotas ==="
echo ""
echo "--- Namespaces ---"
kubectl get ns
echo ""
echo "--- Resource Quotas ---"
kubectl describe resourcequota -n team-alpha 2>/dev/null || echo "(team-alpha namespace not found — expected if using different names)"
echo ""
read -p "Press Enter to continue..."

# Step 4: Apply platform admin RBAC
echo ""
echo "=== Step 4: Apply Platform Admin RBAC ==="
echo ""
kubectl apply -f rbac-platform-admin.yaml
echo ""
read -p "Press Enter to continue..."

# Step 5: Review platform services
echo ""
echo "=== Step 5: Platform Services ==="
echo ""
echo "These are the services that run in the control plane:"
echo "---"
cat platform-services.yaml
echo "---"

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "Build your own control plane:"
echo ""
echo "  1. Create your own Kind cluster:"
echo "     kind create cluster --name my-platform"
echo ""
echo "  2. Review multi-environment config:"
echo "     cat $CODE_DIR/takehome/multi-env-config.yaml"
echo ""
echo "  3. Apply developer RBAC:"
echo "     kubectl apply -f $CODE_DIR/takehome/rbac-developer-role.yaml"
echo ""
echo "  4. Deploy a test application:"
echo "     kubectl apply -f $CODE_DIR/takehome/demo-app-deployment.yaml"
echo ""
echo "  5. Run validation tests:"
echo "     python3 $CODE_DIR/takehome/test-cluster-health.py"
echo "     python3 $CODE_DIR/takehome/test-rbac-permissions.py"
echo ""
echo "Deliverable: A running cluster with 2+ team namespaces, RBAC, and passing tests."
echo "================================================================="
