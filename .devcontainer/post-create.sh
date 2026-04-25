#!/usr/bin/env bash
# Runs after devcontainer features have been applied. pip3 and npm are
# guaranteed to exist by this point because the Python and Node features
# install before postCreateCommand.
set -euo pipefail

echo "==> Installing Python packages"
pip3 install --break-system-packages --no-cache-dir \
    pulumi \
    pulumi-kubernetes \
    scikit-learn \
    pyyaml \
    requests \
    flask \
    matplotlib \
    numpy \
    pre-commit

echo "==> Installing Claude Code CLI"
npm install -g @anthropic-ai/claude-code

echo "==> Tool versions"
kind version
kubectl version --client
helm version --short
pulumi version
conftest --version
k9s version --short
kx --help >/dev/null && echo "kubectx (kx) installed: $(command -v kubectx)"
kubens --help >/dev/null && echo "kubens installed: $(command -v kubens)"
python3 --version
claude --version
