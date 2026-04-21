#!/usr/bin/env bash
# =================================================================
# Session 5 Demo — Self-Service Developer Experience + AI Doc Search
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session5"

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
install_pip_package "scikit-learn" "sklearn"
install_pip_package "pyyaml" "yaml"
echo ""

echo "================================================================="
echo "  SESSION 5 DEMO — Developer Experience & AI Doc Search"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: Catalog entity
echo "=== Step 1: Backstage Catalog Entity ==="
echo ""
echo "This is how a service registers itself in the developer portal:"
echo "---"
cat catalog-info.yaml
echo "---"
echo ""
read -p "Press Enter to continue..."

# Step 2: Backstage config
echo ""
echo "=== Step 2: Backstage App Config ==="
echo ""
cat app-config.yaml
echo ""
read -p "Press Enter to continue..."

# Step 3: Project bootstrapper
echo ""
echo "=== Step 3: Scaffold a New Service ==="
echo ""
echo "One command creates everything a developer needs:"
echo ""
python3 project-bootstrapper.py bootstrap platform demo-api python
echo ""
read -p "Press Enter to continue..."

# Step 4: Explore generated files
echo ""
echo "=== Step 4: Generated Service Files ==="
echo ""
ls -la generated-service/ 2>/dev/null || echo "(generated-service/ directory will appear after bootstrapping)"
echo ""
read -p "Press Enter to continue..."

# Step 5: RAG doc search
echo ""
echo "=== Step 5: AI-Powered Documentation Search (RAG) ==="
echo ""
echo "TF-IDF runs locally — no API key needed:"
echo ""
python3 rag-platform-docs.py

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "  1. Explore the Order Service starter kit:"
echo "     ls -R $CODE_DIR/takehome/order-service/"
echo ""
echo "  2. Run the Onboarding API:"
echo "     python3 $CODE_DIR/takehome/onboarding-api.py"
echo ""
echo "  3. Study the template system:"
echo "     ls $CODE_DIR/takehome/onboarding-templates/"
echo ""
echo "  4. Validate the workflow:"
echo "     python3 $CODE_DIR/takehome/validate-workflow.py"
echo "     python3 $CODE_DIR/takehome/test-onboarding.py"
echo ""
echo "Deliverable: Customize project-bootstrapper.py for your org's service structure."
echo "================================================================="
