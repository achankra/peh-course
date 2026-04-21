#!/usr/bin/env bash
# =================================================================
# Session 1 Demo — Platform Maturity Assessment
# =================================================================
# Run this script to execute the Session 1 live demo.
# It walks through the platform maturity assessment interactively.
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session1"

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
echo ""

echo "================================================================="
echo "  SESSION 1 DEMO — Platform Maturity Assessment"
echo "================================================================="
echo ""
echo "This demo runs the platform maturity assessment interactively."
echo "Score each dimension for your organization (1-5)."
echo ""

# Verify setup
echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

# Step 1: Run the maturity assessment
echo "=== Step 1: Platform Maturity Assessment ==="
echo "Score each dimension for your organization."
echo ""
cd "$CODE_DIR/demo"
python3 platform-maturity-assessment.py

echo ""
echo "=== Demo Complete ==="
echo ""
echo "Reference: Check platform-config.yaml for what a mature platform looks like:"
echo "  cat $CODE_DIR/demo/platform-config.yaml"
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "After the session, work through these exercises to build your"
echo "platform baseline:"
echo ""
echo "  1. Design Principles Checklist:"
echo "     python3 $CODE_DIR/takehome/design-principles-checklist.py platform-config.yaml"
echo ""
echo "  2. Developer Experience Survey:"
echo "     python3 $CODE_DIR/takehome/devex-survey.py"
echo ""
echo "  3. Friction Point Analyzer:"
echo "     python3 $CODE_DIR/takehome/friction-analyzer.py --workflow onboarding"
echo ""
echo "  4. KPI Baseline:"
echo "     python3 $CODE_DIR/takehome/platform-kpi-collector.py"
echo ""
echo "Deliverable: Write a 1-page 'Platform State of the Union' for your team."
echo "================================================================="
