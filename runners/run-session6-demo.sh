#!/usr/bin/env bash
# =================================================================
# Session 6 Demo — Observability, SLOs, Cost + AI Alert Correlation
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session6"

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

# Docker check — Prometheus stack requires a running cluster
if ! docker info &>/dev/null; then
    echo "  [MISSING] Docker daemon is not running!"
    echo "  Prometheus requires a running cluster. Please start Docker Desktop and re-run this script."
    echo ""
    read -p "Press Enter to exit..."
    exit 1
else
    echo "  [OK] Docker daemon"
fi

if ! check_command "kubectl" "Kubernetes CLI (recommended)"; then
    echo "  Install: https://kubernetes.io/docs/tasks/tools/install-kubectl/"
    echo "  (Can demonstrate observability concepts without cluster)"
fi
install_pip_package "pyyaml" "yaml"
install_pip_package "prometheus-client" "prometheus_client"
install_pip_package "requests" "requests"
install_pip_package "scikit-learn" "sklearn"

# Auto-install Prometheus stack if monitoring namespace missing
if command -v kubectl &>/dev/null && command -v helm &>/dev/null; then
    if ! kubectl get ns monitoring &>/dev/null; then
        echo ""
        echo "--- Installing Prometheus stack ---"
        helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 2>/dev/null || true
        helm repo update prometheus-community 2>/dev/null || true
        helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring --create-namespace --wait --timeout 180s
        echo "  [OK] Prometheus stack installed"
    else
        echo "  [OK] Prometheus (monitoring namespace) exists"
    fi
fi
echo ""

echo "================================================================="
echo "  SESSION 6 DEMO — Observability, SLOs & AI Alert Correlation"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: OTel collector config
echo "=== Step 1: OpenTelemetry Collector Config ==="
echo ""
echo "The single entry point for all telemetry (receivers, processors, exporters):"
echo "---"
cat otel-collector-config.yaml
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 2: Deploy the collector
echo ""
echo "=== Step 2: Deploy OTel Collector ==="
echo ""
kubectl apply -f otel-collector-deployment.yaml 2>/dev/null || echo "(kubectl not connected — this deploys the OTel Collector to your cluster)"
echo ""
read -p "Press Enter to continue..."

# Step 3: SLO definition
echo ""
echo "=== Step 3: SLO Definition with Sloth ==="
echo ""
echo "Sloth generates Prometheus recording rules from simple YAML:"
echo "---"
cat sloth-auth-service-slo.yaml
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 4: Cost analysis
echo ""
echo "=== Step 4: Cost Analysis ==="
echo ""
python3 cost-analyzer.py 2>/dev/null || echo "(Requires kubectl connected to cluster for live data)"
echo ""
read -p "Press Enter to continue..."

# Step 5: AI alert correlation
echo ""
echo "=== Step 5: AI-Powered Alert Correlation ==="
echo ""
echo "50 raw alerts → grouped into root-cause incidents:"
echo ""
python3 alert-correlator.py

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "  1. Instrument an application:"
echo "     python3 $CODE_DIR/takehome/instrument-app.py"
echo ""
echo "  2. Configure alerting:"
echo "     kubectl apply -f $CODE_DIR/takehome/alert-rules.yaml"
echo ""
echo "  3. Deploy HPA and VPA:"
echo "     kubectl apply -f $CODE_DIR/takehome/checkout-api-hpa.yaml"
echo "     kubectl apply -f $CODE_DIR/takehome/checkout-api-vpa.yaml"
echo ""
echo "  4. Set up cost monitoring:"
echo "     python3 $CODE_DIR/takehome/cost-allocation-labels.py"
echo "     python3 $CODE_DIR/takehome/cost-anomaly-detector.py --generate-data"
echo ""
echo "  5. Map observability personas:"
echo "     python3 $CODE_DIR/takehome/observability-personas.py"
echo ""
echo "  6. Explore AI agent observability:"
echo "     python3 $CODE_DIR/takehome/ai-agent-observability.py"
echo ""
echo "Deliverable: An SLO definition for one of your real services + HPA configured."
echo "================================================================="
