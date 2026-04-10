# Building an AI-Powered Internal Developer Platform from Scratch

A hands-on, 2-day workshop by [Ajay Chankramath](mailto:ajay@platformetrics.com), author of *The Platform Engineer's Handbook* (Packt, 2026).

**Register:** [Eventbrite - Building an AI-Powered Internal Developer Platform from Scratch](https://www.eventbrite.co.uk/e/building-an-ai-powered-internal-developer-platform-from-scratch-tickets-1978960034736)

### Companion Resources

This course is based on *The Platform Engineer's Handbook*. The book covers the full breadth of platform engineering across 14 chapters, including tools like ArgoCD, Argo Rollouts, OpenCost, and more that go beyond what we can cover in two days. The course distills the book's core concepts into a hands-on, buildable platform you can take home.

- **Book Companion Site:** [peh-packt.platformetrics.com](https://peh-packt.platformetrics.com/)
- **Book GitHub Repo:** [github.com/achankra/peh](https://github.com/achankra/peh) — full code samples for all 14 chapters
- **Course GitHub Repo:** [github.com/achankra/peh-course](https://github.com/achankra/peh-course) — this repo (workshop code only)

---

## What This Course Is About

Most platform engineering content stops at theory. This workshop starts from an empty terminal and ends with a fully functional, AI-augmented Internal Developer Platform running on your laptop. Over two days (4 hours each, 9 sessions), you will build every layer of the platform yourself — from cluster provisioning and infrastructure-as-code through developer portals, observability, chaos engineering, and AI-powered operations.

No cloud accounts required. No vendor lock-in. Everything runs locally on Kubernetes (Kind), uses open-source tools, and is designed so you can take what you build straight back to your team.

### What You'll Walk Away With

- A working IDP running on Kind with self-service namespaces, RBAC, and resource quotas
- Crossplane XRDs that let developers provision databases with 10 lines of YAML
- A Backstage developer portal with software templates and a service catalog
- Full observability (OpenTelemetry, Prometheus, Jaeger, Loki) with SLO-driven alerting
- Progressive delivery (canary, blue-green) with automated rollback
- Chaos engineering experiments with Chaos Mesh
- AI-powered capabilities: RAG doc search, multi-agent incident response, alert correlation, AI governance
- A 30/60/90-day platform adoption roadmap

### Who Should Attend

Platform Engineers, DevOps Engineers, SREs, Infrastructure Engineers, Engineering Managers, AI/ML Engineers building internal tooling, and anyone responsible for developer productivity.

---

## Tech Stack

The course standardizes on one tool per job to keep setup simple and eliminate "which tool should I use?" decisions. Everything below is open source and runs locally.

| Layer | Tool | Purpose |
|---|---|---|
| **Container Runtime** | Docker Desktop | Runs containers locally |
| **Kubernetes** | Kind (Kubernetes in Docker) | Local multi-node clusters |
| **IaC / Provisioning** | Pulumi (Python SDK) | Cluster and resource provisioning |
| **Resource Abstraction** | Crossplane | Self-service XRDs, Compositions, Claims |
| **Policy Engine** | OPA / Conftest / Gatekeeper | Policy-as-Code, shift-left validation |
| **Developer Portal** | Backstage | Service catalog, software templates, docs |
| **CI/CD** | GitHub Actions | Reusable workflow pipelines |
| **Observability** | OpenTelemetry Collector | Unified telemetry collection |
| **Metrics** | Prometheus + Sloth | Metrics, SLO-driven alerting |
| **Tracing** | Jaeger | Distributed tracing |
| **Logging** | Loki | Log aggregation |
| **Autoscaling** | HPA / VPA | Horizontal and Vertical Pod Autoscaling |
| **Chaos Engineering** | Chaos Mesh | Fault injection experiments |
| **Progressive Delivery** | Canary / Blue-Green | Built-in deployment manifests with rollback controller |
| **Backup & Recovery** | Velero | Cluster backup and restore |
| **AI / LLM** | Anthropic Claude (optional) | RAG, multi-agent incident response |
| **AI (Local / No API Key)** | TF-IDF (scikit-learn) | Local doc search, alert correlation |
| **Language** | Python 3 | All scripts and automation |

> **Note on AI features:** Every AI demo has a local-only fallback (TF-IDF, heuristics) that runs without any API key. Claude integration is optional for those who want to explore LLM-powered capabilities.

> **Looking for ArgoCD, Argo Rollouts, OpenCost, or other tools?** The book covers a broader set of tools across 14 chapters. See the [book repo](https://github.com/achankra/peh) for the full stack. This course focuses on the subset you can build and run in two days.

---

## Prerequisites

Minimal by design. You need a laptop, a terminal, and the tools below.

### Hardware

- 8 GB RAM minimum (16 GB recommended)
- 20 GB free disk space
- macOS, Linux, or Windows (with WSL2)

### Software — Install Before Day 1

| Tool | Version | Install |
|---|---|---|
| **Docker Desktop** | Latest | [docker.com/get-started](https://www.docker.com/get-started/) |
| **Kind** | v0.20+ | `brew install kind` or [kind.sigs.k8s.io](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) |
| **kubectl** | v1.28+ | `brew install kubectl` or [kubernetes.io/docs/tasks/tools](https://kubernetes.io/docs/tasks/tools/) |
| **Helm** | v3.12+ | `brew install helm` or [helm.sh/docs/intro/install](https://helm.sh/docs/intro/install/) |
| **Python 3** | 3.10+ | `brew install python3` or [python.org](https://www.python.org/downloads/) |
| **pip3** | Latest | Comes with Python 3 |
| **Node.js** | v18+ | `brew install node` (for Backstage) |
| **Git** | Latest | `brew install git` |
| **Pulumi** | Latest | `brew install pulumi` or [pulumi.com/docs/install](https://www.pulumi.com/docs/install/) |
| **conftest** | Latest | `brew install conftest` or [conftest.dev](https://www.conftest.dev/install/) |

### Python Packages

```bash
pip3 install pulumi pulumi-kubernetes scikit-learn pyyaml requests --break-system-packages
```

### Quick Validation

Run this after installation to confirm everything works:

```bash
docker --version
kind --version
kubectl version --client
helm version --short
python3 --version
pulumi version
conftest --version
```

---

## Repository Structure

Every session has two folders: **demo** (what we build together live) and **takehome** (exercises to reinforce learning after the session). Each folder has its own README with step-by-step instructions.

```
Code/
├── Session1/           # Platform Engineering Fundamentals
│   ├── demo/           # Platform maturity assessment
│   └── takehome/       # Deep platform analysis & baseline KPIs
├── Session2/           # Infrastructure & Control Plane
│   ├── demo/           # Kind cluster, namespaces, RBAC, Pulumi
│   └── takehome/       # Build your own control plane
├── Session3/           # IaC, Policy & CI/CD
│   ├── demo/           # Crossplane XRDs, conftest, AI templates
│   └── takehome/       # Pipeline authoring, Rego policies
├── Session4/           # Day 1 Integration & Synthesis
│   ├── demo/           # End-to-end verification test suites
│   └── takehome/       # Consolidation, prep for Day 2
├── Session5/           # Developer Experience & Self-Service
│   ├── demo/           # Backstage, project bootstrapper, RAG doc search
│   └── takehome/       # Onboarding pipeline, starter kit templates
├── Session6/           # Observability, SLOs & Cost Management
│   ├── demo/           # OTel Collector, Sloth SLOs, AI alert correlation
│   └── takehome/       # Full observability stack, HPA/VPA, cost monitoring
├── Session7/           # Production Readiness, Security & Resilience
│   ├── demo/           # Chaos Mesh, canary deployments, AI runbook automation
│   └── takehome/       # Velero backups, blue-green, security scanning
├── Session8/           # AI-Augmented Platforms
│   ├── demo/           # Multi-agent incident response, AI governance, RAG
│   └── takehome/       # Full AI platform stack, guardrails, agent testing
└── Session9/           # Workshop Synthesis & Next Steps
    ├── demo/           # Platform KPI measurement, AI impact metrics
    └── takehome/       # 30/60/90-day roadmap, maturity re-assessment
```

---

## Course Agenda

### Day 1 — Foundations (4 hours)

| Session | Title | Focus |
|---|---|---|
| [Session 1](Session1/) | **Platform Engineering Fundamentals** | Why platforms, maturity model, design principles, Platform as Product |
| [Session 2](Session2/) | **Infrastructure & Control Plane** | Kind cluster, Pulumi IaC, namespace isolation, RBAC, resource quotas |
| [Session 3](Session3/) | **IaC, Policy & CI/CD** | Crossplane self-service, OPA/Conftest policies, AI-generated templates, GitOps pipelines |
| [Session 4](Session4/) | **Day 1 Integration & Synthesis** | End-to-end verification, cross-layer testing, consolidation |

### Day 2 — Experience, Operations & AI (4 hours)

| Session | Title | Focus |
|---|---|---|
| [Session 5](Session5/) | **Developer Experience & Self-Service** | Backstage portal, service catalog, golden paths, AI-powered doc search (RAG) |
| [Session 6](Session6/) | **Observability, SLOs & Cost** | OpenTelemetry, Prometheus, Sloth SLOs, cost analysis, AI alert correlation |
| [Session 7](Session7/) | **Production Readiness & Resilience** | Chaos Mesh, canary/blue-green, Velero backups, AI runbook automation |
| [Session 8](Session8/) | **AI-Augmented Platforms** | Multi-agent incident response, AI governance, agent observability, MCP integration |
| [Session 9](Session9/) | **Workshop Synthesis & Next Steps** | KPI measurement, AI impact metrics, 30/60/90-day adoption roadmap |

---

## Getting Started

### Step 1: Create Your Cluster (Before Session 2)

Session 1 is mostly conceptual — you just need Python 3. From Session 2 onward, everything runs on Kind:

```bash
kind create cluster --name workshop
kubectl cluster-info --context kind-workshop
```

### Step 2: Install Platform Services (Session 2)

```bash
cd Session2/demo
python3 namespace-provisioner.py
kubectl apply -f rbac-platform-admin.yaml
```

### Step 3: Add Crossplane and Policies (Session 3)

```bash
cd Session3/demo
kubectl apply -f crossplane-providers.yaml
kubectl apply -f xrd-postgresql.yaml
kubectl apply -f composition-postgresql.yaml
conftest test conftest-tests/test-manifests.yaml -p conftest-tests/
```

### Step 4: Backstage and Developer Experience (Session 5)

```bash
cd Session5/demo
python3 project-bootstrapper.py
python3 rag-platform-docs.py
```

### Step 5: Observability Stack (Session 6)

```bash
cd Session6/demo
kubectl apply -f otel-collector-deployment.yaml
python3 alert-correlator.py
```

### Step 6: Chaos and Resilience (Session 7)

```bash
cd Session7/demo
kubectl apply -f chaos-network-delay.yaml
python3 chaos-runner.py
python3 runbook-automator.py
```

### Step 7: AI Platform Capabilities (Session 8)

```bash
cd Session8/demo
python3 incident-agent.py
python3 ai-agent-observability.py
```

### Step 8: Measure and Plan (Session 9)

```bash
cd Session9/demo
python3 platform-kpi-collector.py
python3 measure-ai-impact.py
```

---

## Session-by-Session Installation

If you prefer to install tools incrementally as needed:

### Session 1 — No extra tools needed
```bash
python3 --version   # Confirm Python 3.10+
```

### Session 2 — Kubernetes + Pulumi
```bash
kind create cluster --name workshop
pip3 install pulumi pulumi-kubernetes --break-system-packages
```

### Session 3 — Crossplane + Conftest
```bash
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
# conftest should already be installed from prerequisites
```

### Session 4 — No extra tools (verification only)
```bash
python3 Session4/demo/test-cluster-health.py
python3 Session4/demo/test-infrastructure.py
python3 Session4/demo/test-policies.py
```

### Session 5 — Backstage + scikit-learn
```bash
pip3 install scikit-learn --break-system-packages
# Backstage (optional local setup): npx @backstage/create-app@latest
```

### Session 6 — OTel + Prometheus + Sloth
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace
pip3 install pyyaml requests --break-system-packages
```

### Session 7 — Chaos Mesh + Velero
```bash
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm install chaos-mesh chaos-mesh/chaos-mesh --namespace chaos-mesh --create-namespace
# Velero: https://velero.io/docs/main/basic-install/
```

### Session 8 — AI Dependencies (Optional Claude API)
```bash
pip3 install scikit-learn pyyaml --break-system-packages
# Optional (for LLM features): export ANTHROPIC_API_KEY=your-key-here
```

### Session 9 — No extra tools
```bash
# Uses tools already installed. Just run the scripts.
```

---

## About the Author

**Ajay Chankramath** is the author of *The Platform Engineer's Handbook* (Packt, 2026) and founder of Platformetrics. He has built internal developer platforms at scale and writes about platform engineering, DevOps, and developer experience.

- Email: [ajay@platformetrics.com](mailto:ajay@platformetrics.com)
- Book: [The Platform Engineer's Handbook](https://www.packtpub.com/en-us/product/the-platform-engineers-handbook-9781805128885)
- Companion Site: [peh-packt.platformetrics.com](https://peh-packt.platformetrics.com/)
- Book Code: [github.com/achankra/peh](https://github.com/achankra/peh)

---

## License

This workshop material is provided as part of the Packt course. See individual session READMEs for detailed instructions on each exercise.
