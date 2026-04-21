#!/usr/bin/env bash
# =================================================================
# Session 8 Demo — AI-Augmented Platforms
# =================================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODE_DIR="$SCRIPT_DIR/../Session8"

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
echo "  SESSION 8 DEMO — AI-Augmented Platforms"
echo "================================================================="
echo ""

echo "--- Verifying setup ---"
python3 "$CODE_DIR/verify_module.py"
echo ""

read -p "Press Enter to start the demo..."
echo ""

cd "$CODE_DIR/demo"

# Step 1: RAG doc search
echo "=== Step 1: RAG Documentation Search (No API Key) ==="
echo ""
echo "AI searches your platform docs — TF-IDF runs locally:"
echo ""
python3 rag-platform-docs.py
echo ""
read -p "Press Enter to continue..."

# Step 2: Multi-agent incident response
echo ""
echo "=== Step 2: Multi-Agent Incident Response ==="
echo ""
echo "Triage → Diagnosis → Remediation agents working together:"
echo ""
python3 incident-agent.py
echo ""
read -p "Press Enter to continue..."

# Step 3: AI agent observability
echo ""
echo "=== Step 3: AI Agent Observability ==="
echo ""
echo "Monitoring AI agents like production services:"
echo ""
python3 ai-agent-observability.py
echo ""
read -p "Press Enter to continue..."

# Step 4: AI governance alerts
echo ""
echo "=== Step 4: AI Governance Alerts ==="
echo ""
echo "Prometheus alerts for AI confidence, override rates, latency:"
echo "---"
cat ai-governance-alerts.yaml
echo "---"

echo ""
echo "=== Demo Complete ==="
echo ""
echo "================================================================="
echo "  TAKEHOME EXERCISES"
echo "================================================================="
echo ""
echo "  1. Build a full RAG pipeline:"
echo "     python3 $CODE_DIR/takehome/rag_pipeline.py"
echo "     (Requires ANTHROPIC_API_KEY for LLM features, TF-IDF fallback works without)"
echo ""
echo "  2. Explore multi-agent orchestration:"
echo "     cat $CODE_DIR/takehome/multi_agent_system.py"
echo ""
echo "  3. Set up AI guardrails:"
echo "     python3 $CODE_DIR/takehome/ai-guardrails.py"
echo ""
echo "  4. Automate a runbook:"
echo "     python3 $CODE_DIR/takehome/runbook-automator.py"
echo ""
echo "  5. Study AI-generated service templates:"
echo "     cat $CODE_DIR/takehome/backstage-ai-template.yaml"
echo ""
echo "  6. Correlate alerts:"
echo "     python3 $CODE_DIR/takehome/alert-correlator.py"
echo ""
echo "  7. Run AI agent tests:"
echo "     python3 $CODE_DIR/takehome/test-ai-agents.py"
echo ""
echo "Deliverable: Identify one runbook to automate + 3 guardrails + AI adoption plan."
echo "================================================================="
