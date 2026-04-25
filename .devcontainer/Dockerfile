FROM mcr.microsoft.com/devcontainers/base:trixie

SHELL ["/bin/bash", "-l", "-c"]

# Install essential packages and Python build deps (for matplotlib, scikit-learn etc.)
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        libffi-dev \
        liblzma-dev \
        curl \
        git \
        jq \
        vim \
        wget \
        ca-certificates \
        gnupg \
        lsb-release \
        netcat-openbsd \
        socat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# kind — Kubernetes in Docker (used by every Session 2+ runner)
RUN curl -fsSLo /usr/local/bin/kind \
        https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64 && \
    chmod +x /usr/local/bin/kind

# Helm — installs Crossplane / Prometheus / Chaos Mesh into the cluster
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Pulumi — Session 2 IaC
RUN curl -fsSL https://get.pulumi.com | sh && \
    ln -sf /root/.pulumi/bin/pulumi /usr/local/bin/pulumi && \
    ln -sf /root/.pulumi/bin/pulumi-language-python /usr/local/bin/pulumi-language-python

# conftest — Session 3 policy testing
RUN curl -fsSL https://github.com/open-policy-agent/conftest/releases/download/v0.68.2/conftest_0.68.2_Linux_x86_64.tar.gz \
        | tar -xz -C /usr/local/bin conftest

# Velero CLI — Session 7 backup/restore
RUN curl -fsSL https://github.com/vmware-tanzu/velero/releases/download/v1.18.0/velero-v1.18.0-linux-amd64.tar.gz \
        | tar -xz -C /tmp && \
    mv /tmp/velero-v1.18.0-linux-amd64/velero /usr/local/bin/velero && \
    rm -rf /tmp/velero-v1.18.0-linux-amd64

# k9s — terminal UI for navigating Kubernetes clusters
RUN curl -fsSL https://github.com/derailed/k9s/releases/download/v0.50.18/k9s_Linux_amd64.tar.gz \
        | tar -xz -C /usr/local/bin k9s

# kubectx + kubens — fast Kubernetes context/namespace switching (kx = kubectx alias)
RUN curl -fsSL https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx_v0.9.5_linux_x86_64.tar.gz \
        | tar -xz -C /usr/local/bin kubectx && \
    curl -fsSL https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubens_v0.9.5_linux_x86_64.tar.gz \
        | tar -xz -C /usr/local/bin kubens && \
    ln -sf /usr/local/bin/kubectx /usr/local/bin/kx

# Python packages are installed via postCreateCommand in devcontainer.json,
# AFTER the Python feature has installed pip3. Installing them here would fail
# because devcontainer features run after the Dockerfile build.
