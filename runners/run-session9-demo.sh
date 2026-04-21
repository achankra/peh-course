#!/usr/bin/env bash
# =================================================================
# Session 9 Demo — Workshop Synthesis, Team Topologies & Next Steps
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session9"

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
install_pip_package "pyyaml" "yaml"
echo ""

echo "================================================================="
echo "  SESSION 9 DEMO — Team Topologies, KPIs & Next Steps"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: Team topology visualization
echo "=== Step 1: Team Topology Generator (Conway's Law) ==="
echo ""
echo "Visualize how your platform mirrors your org structure:"
echo ""
python3 team-topology-generator.py
echo ""
read -p "Press Enter to continue..."

# Step 2: Platform KPIs
echo ""
echo "=== Step 2: Platform KPI Collection ==="
echo ""
echo "DORA metrics — deployment frequency, lead time, MTTR, change failure rate:"
echo ""
python3 platform-kpi-collector.py
echo ""
read -p "Press Enter to continue..."

# Step 3: AI impact measurement
echo ""
echo "=== Step 3: Measure AI Impact ==="
echo ""
python3 measure-ai-impact.py

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME — YOUR 30/60/90 DAY PLAN"
echo "================================================================="
echo ""
echo "  1. Map your team topology:"
echo "     python3 $CODE_DIR/demo/team-topology-generator.py"
echo ""
echo "  2. Re-run the maturity assessment (compare with Day 1):"
echo "     python3 $CODE_DIR/takehome/platform-maturity-assessment.py"
echo ""
echo "  3. Establish cost baseline:"
echo "     python3 $CODE_DIR/takehome/cost-analyzer.py"
echo ""
echo "  4. Document friction points:"
echo "     python3 $CODE_DIR/takehome/friction-analyzer.py --workflow onboarding"
echo ""
echo "  30-Day Goals: Pick ONE golden path, set up Kind cluster, deploy namespace provisioner"
echo "  60-Day Goals: First Backstage template, first Crossplane XRD, conftest in CI"
echo "  90-Day Goals: Onboard second team, run first chaos experiment, present to leadership"
echo ""
echo "================================================================="
echo "  Thank you for attending!"
echo "  Book: The Platform Engineer's Handbook (Packt)"
echo "  Code: github.com/achankra/peh"
echo "================================================================="
