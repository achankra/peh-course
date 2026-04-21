# Building an AI-Powered Internal Developer Platform from Scratch: Terminology Reference

This document serves as a comprehensive terminology reference for the 2-day workshop "Building an AI-Powered Internal Developer Platform from Scratch" by Ajay Chankramath. It covers platform engineering, Kubernetes, infrastructure as code, GitOps, developer experience, observability, AI-augmented platforms, and organizational design concepts.

---

| Term | Definition | Learn More |
|------|-----------|-----------|
| ACK (AWS Controllers for Kubernetes) | AWS service controllers that enable management of AWS resources directly from Kubernetes using custom resource definitions. | https://aws-controllers-k8s.github.io/community/ |
| Admission Controller | Kubernetes components that intercept requests to the API server and can validate, mutate, or deny them based on policies. | https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/ |
| AI Governance | Framework and policies for responsible, ethical, and compliant use of artificial intelligence systems in organizations. | https://www.nist.gov/publications/artificial-intelligence-risk-management-framework |
| Alert Correlation | Technique for grouping and analyzing related alerts to reduce alert fatigue and identify root causes. | https://grafana.com/docs/grafana/latest/alerting/ |
| Anomaly Detection | ML technique to identify unusual patterns or deviations in system behavior, metrics, or data. | https://scikit-learn.org/stable/modules/unsupervised.html |
| OWASP | Open Worldwide Application Security Project providing standards, frameworks, and tools for building secure applications. | https://owasp.org/ |
| ArgoCD | GitOps continuous delivery tool for Kubernetes that automatically syncs application state from Git repositories. | https://argoproj.github.io/cd/ |
| Artificial Intelligence (AI) | Computer systems designed to perform tasks that typically require human intelligence, such as learning and problem-solving. | https://www.anthropic.com/ |
| ASO (Azure Service Operator) | Azure service operator enabling management of Azure resources through Kubernetes custom resources. | https://azure.github.io/azure-service-operator/ |
| Atlantis | Tool for automating Terraform workflows in pull requests, enabling collaborative infrastructure changes. | https://www.runatlantis.io/ |
| Backstage (Spotify) | Open-source developer portal platform providing a centralized hub for managing microservices, infrastructure, and documentation. | https://backstage.io/ |
| Backup & Disaster Recovery | Processes and systems for protecting data and ensuring business continuity in case of failure or data loss. | https://velero.io/ |
| Blast Radius | The scope or extent of potential impact from a failure, change, or deployment in a system. | https://www.gremlin.com/chaos-engineering/blast-radius/ |
| Blue-Green Deployment | Deployment strategy where two identical production environments (blue and green) allow zero-downtime releases. | https://martinfowler.com/bliki/BlueGreenDeployment.html |
| Bulkhead Pattern | Architectural pattern that isolates resources to prevent cascading failures across system components. | https://docs.microsoft.com/en-us/azure/architecture/patterns/bulkhead |
| Canary Deployment | Deployment strategy that gradually rolls out changes to a subset of users to detect issues before full rollout. | https://semaphoreci.com/blog/canary-deployments |
| catalog-info.yaml | YAML file used in Backstage to define software components and their metadata in the software catalog. | https://backstage.io/docs/features/software-catalog/descriptor-format |
| CDKTF (CDK for Terraform) | AWS Cloud Development Kit for Terraform, allowing infrastructure to be defined using programming languages. | https://developer.hashicorp.com/terraform/cdktf |
| Chaos Engineering | Discipline of experimentation to identify system weaknesses and build resilience through controlled failures. | https://www.gremlin.com/chaos-engineering/ |
| Chaos Mesh | Open-source chaos engineering platform for Kubernetes that injects failures to test system resilience. | https://chaos-mesh.org/ |
| Chaos Monkey (Netflix) | Pioneering tool that randomly kills production instances to test system resilience and fault tolerance. | https://netflix.github.io/chaosmonkey/ |
| CI/CD (Continuous Integration / Continuous Delivery) | Practices of automatically building, testing, and deploying code changes to production frequently and reliably. | https://www.atlassian.com/continuous-delivery/ci-cd |
| Circuit Breaker | Design pattern that stops requests to a failing service temporarily to prevent cascading failures. | https://martinfowler.com/bliki/CircuitBreaker.html |
| Claude (Anthropic) | Large language model created by Anthropic, used for natural language understanding and AI-powered applications. | https://www.anthropic.com/claude |
| CNCF (Cloud Native Computing Foundation) | Vendor-neutral foundation hosting and promoting open-source cloud-native projects like Kubernetes and Prometheus. | https://www.cncf.io/ |
| Cognitive Load | The amount of mental effort required to use a system; a key metric in measuring developer experience. | https://www.linkedin.com/pulse/cognitive-load-developer-experience-jeanpierre-urquhart |
| Cognition as Code | Approach of encoding organizational knowledge and decision logic into automated systems and policies. | https://www.cortex.io/ |
| Compliance as Code | Practice of encoding compliance requirements and policies as machine-readable code for automated enforcement. | https://www.viaduct.io/compliance-as-code |
| Complicated-Subsystem Team | Team topology focused on managing complex technical subsystems requiring deep expertise. | https://teamtopologies.com/ |
| Composition (Crossplane) | Crossplane feature that defines how composite resources are composed from primitive resources. | https://docs.crossplane.io/v1.13/concepts/compositions/ |
| Composite Resource Definition (XRD) | Crossplane resource definition that enables creation of new resource types by composing existing ones. | https://docs.crossplane.io/v1.13/getting-started/create-a-composite-resource/ |
| ConstraintTemplate | Gatekeeper template that defines a policy rule to be enforced across Kubernetes clusters. | https://open-policy-agent.github.io/gatekeeper/website/docs/howto/#creating-constrainttemplates |
| Container | Lightweight, isolated runtime environment packaging application code, dependencies, and configuration. | https://www.docker.com/resources/what-container |
| Conftest | Command-line tool for testing configuration files against Open Policy Agent policies. | https://www.conftest.dev/ |
| ConfigMap | Kubernetes object for storing non-sensitive configuration data as key-value pairs. | https://kubernetes.io/docs/concepts/configuration/configmap/ |
| Continuous Reconciliation | Pattern where systems continuously compare desired and actual state, automatically fixing drift. | https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/ |
| Control Plane | Kubernetes components that manage the state of the cluster and make decisions about the cluster. | https://kubernetes.io/docs/concepts/overview/components/#control-plane |
| Conway's Law | Principle stating that system architecture mirrors the communication structure of the organization that designs it. | https://en.wikipedia.org/wiki/Conway%27s_law |
| Copilot | AI-powered assistant that helps developers write code, understand systems, or perform operational tasks. | https://github.com/features/copilot |
| Cost Allocation | Process of attributing cloud service costs to specific teams, projects, or business units. | https://www.finops.org/perspective/cost-allocation/ |
| Cortex (developer portal) | AI-powered developer portal for managing software catalogs and measuring engineering metrics. | https://www.cortex.io/ |
| CRD (Custom Resource Definition) | Kubernetes mechanism for extending the API with custom resources defined by users. | https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/ |
| Crossplane | Open-source platform for infrastructure orchestration, enabling multi-cloud resource management from Kubernetes. | https://www.crossplane.io/ |
| CVE (Common Vulnerabilities and Exposures) | Standard system for identifying and sharing information about known cybersecurity vulnerabilities. | https://www.cve.org/ |
| Data Plane | Kubernetes components that run application workloads and execute container operations. | https://kubernetes.io/docs/concepts/overview/components/#node-components |
| Deployment | Kubernetes object that manages replicated application pods and ensures desired state is maintained. | https://kubernetes.io/docs/concepts/workloads/controllers/deployment/ |
| Developer Experience (DevEx) | Holistic quality of the experience developers have when using tools, platforms, and processes. | https://gist.github.com/shipit-crew/4d84ebee0f2dbdffc0c19cae0c9eaf61 |
| Developer NPS | Net Promoter Score metric measuring developer satisfaction and likelihood to recommend the platform. | https://www.spacelift.io/blog/developer-satisfaction-metrics |
| Developer Portal | Centralized platform providing developers with access to tools, services, documentation, and self-service capabilities. | https://backstage.io/ |
| DevSecOps | Practice of integrating security into the development and operations pipeline from the start. | https://www.devsecops.org/ |
| Diagnosis Agent | AI agent specialized in analyzing system logs and traces to identify root causes of issues. | https://www.anthropic.com/research/agents |
| Distributed Tracing (Traces) | Observability technique tracking requests across multiple services to understand system behavior and latency. | https://opentelemetry.io/docs/concepts/signals/traces/ |
| Docker | Popular containerization platform enabling packaging applications and dependencies into containers. | https://www.docker.com/ |
| DORA Metrics | Four key metrics (Deployment Frequency, Lead Time for Changes, Change Failure Rate, MTTR) measuring delivery performance. | https://dora.dev/ |
| Drift Detection | Process of identifying differences between desired configuration and actual runtime state. | https://docs.crossplane.io/v1.13/concepts/compositions/#composition-functions |
| Embeddings | Vector representations of text or data enabling semantic search and ML-powered analysis. | https://openai.com/research/vision-transformers-for-semantic-segmentation |
| Enabling Team | Team topology focused on removing blockers and building capabilities for other teams. | https://teamtopologies.com/key-concepts |
| Environment Promotion | Process of moving code and configuration through development, staging, and production environments. | https://www.atlassian.com/continuous-delivery/environments |
| Error Budget | Agreed-upon acceptable amount of downtime or failures an SLO permits before triggering incident response. | https://www.site-reliability-engineering.info/error-budgets/ |
| Flask | Lightweight Python web framework for building web applications and APIs. | https://flask.palletsprojects.com/ |
| FinOps | Practice of bringing financial accountability to cloud spending through process and culture. | https://www.finops.org/ |
| FinOps Foundation | Organization promoting FinOps practices and providing frameworks for cloud cost optimization. | https://www.finops.org/ |
| Flow Engineering | Approach to optimizing developer workflow and reducing delays in software delivery processes. | https://www.swarmia.com/blog/flow-efficiency/ |
| Flux | GitOps continuous delivery solution for Kubernetes that automatically syncs from Git. | https://fluxcd.io/ |
| Gatekeeper | OPA-based policy enforcement tool for Kubernetes that validates resources before creation. | https://open-policy-agent.github.io/gatekeeper/ |
| Git | Distributed version control system for managing code and configuration changes. | https://git-scm.com/ |
| GitHub Actions | GitHub's native CI/CD platform enabling automation of workflows triggered by events. | https://github.com/features/actions |
| GitOps | Operational model where Git is the single source of truth for infrastructure and application state. | https://about.gitlab.com/topics/gitops/ |
| Golden Paths / Paved Roads | Curated, recommended paths for common tasks in an IDP that abstract complexity and guide developers. | https://humanitec.com/blog/golden-paths |
| Grafana | Visualization and analytics platform for monitoring metrics and logs from various data sources. | https://grafana.com/ |
| Guardrails (AI) | Constraints and safety mechanisms built into AI systems to ensure appropriate behavior and compliance. | https://www.anthropic.com/research/constitutional-ai |
| HCL (HashiCorp Configuration Language) | Domain-specific language used for infrastructure as code, particularly in Terraform and Consul. | https://www.terraform.io/language |
| Harness IDP | Continuous delivery and infrastructure deployment platform with integrated IDP capabilities. | https://harness.io/platform/continuous-delivery |
| Health Checks (Liveness, Readiness, Startup Probes) | Kubernetes probes that determine if a container is running, ready to accept traffic, or still starting. | https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| Helm | Package manager for Kubernetes enabling templating and management of Kubernetes applications. | https://helm.sh/ |
| HPA (Horizontal Pod Autoscaler) | Kubernetes controller that automatically scales the number of pods based on metrics like CPU usage. | https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/ |
| Human-in-the-Loop | AI system design pattern where humans are involved in decision-making and validation processes. | https://www.anthropic.com/research/constitutional-ai |
| Humanitec Score | Metric quantifying the maturity and effectiveness of an organization's Internal Developer Platform. | https://humanitec.com/products/humanitec-score |
| Incident Response | Processes and procedures for managing and resolving production incidents and outages. | https://www.pagerduty.com/resources/learn/incident-response-process/ |
| Infrastructure as Code (IaC) | Practice of managing and provisioning infrastructure using machine-readable code files. | https://www.terraform.io/intro |
| Ingress | Kubernetes object for managing external HTTP/HTTPS access to services within a cluster. | https://kubernetes.io/docs/concepts/services-networking/ingress/ |
| Internal Developer Platform (IDP) | Curated set of capabilities and tools that reduce cognitive load and enable self-service for developers. | https://humanitec.com/blog/what-is-an-internal-developer-platform |
| Interaction Modes (Collaboration, X-as-a-Service, Facilitating) | Team Topologies concept defining how teams interact: collaboration, consuming services, or enabling others. | https://teamtopologies.com/key-concepts |
| Inverse Conway Maneuver | Practice of structuring organizations to produce desired system architecture through communication structure changes. | https://www.martinfowler.com/articles/inverse-conway-maneuver.html |
| Jaeger | Open-source distributed tracing platform for monitoring and troubleshooting microservices. | https://www.jaegertracing.io/ |
| KCC (Google Config Connector) | Tool enabling management of Google Cloud resources through Kubernetes custom resources. | https://cloud.google.com/config-connector/docs |
| Kind (Kubernetes in Docker) | Tool for running Kubernetes clusters inside Docker containers, useful for local development and testing. | https://kind.sigs.k8s.io/ |
| kubectl | Command-line interface for interacting with Kubernetes clusters and managing resources. | https://kubernetes.io/docs/reference/kubectl/ |
| Kratix | Open-source tool for building Kubernetes platforms with composable capabilities and patterns. | https://kratix.io/ |
| Kubernetes (K8s) | Open-source container orchestration platform automating deployment, scaling, and management of containerized applications. | https://kubernetes.io/ |
| Large Language Model (LLM) | Advanced AI model trained on large text datasets, capable of understanding and generating human language. | https://www.anthropic.com/research/constitutional-ai |
| Lead Time for Changes | DORA metric measuring the time from code commit to production deployment. | https://dora.dev/ |
| LimitRange | Kubernetes resource that enforces minimum and maximum compute resource constraints for containers. | https://kubernetes.io/docs/concepts/policy/limit-range/ |
| Loki | Log aggregation system designed for efficient storage and querying of logs from cloud-native applications. | https://grafana.com/oss/loki/ |
| Machine Learning (ML) | Field of artificial intelligence focused on building systems that learn from data and improve over time. | https://scikit-learn.org/stable/ |
| McKinsey Developer Productivity Study | Research finding that effective developer platforms can improve productivity by approximately 35%. | https://www.mckinsey.com/industries/technology-media-and-telecommunications/our-insights/platform-engineering-in-the-platform-economy |
| MELT (Metrics, Events, Logs, Traces) | Comprehensive set of observability signals providing complete visibility into system behavior. | https://opentelemetry.io/docs/concepts/signals/ |
| Metrics | Quantitative measurements of system behavior collected at regular intervals for monitoring. | https://prometheus.io/docs/concepts/data_model/ |
| MinIO | High-performance S3-compatible object storage system useful for backup and disaster recovery. | https://min.io/ |
| Model Context Protocol (MCP) | Protocol enabling AI models to interact with external tools, data sources, and systems securely. | https://modelcontextprotocol.io/ |
| MTTR (Mean Time to Recovery) | Average time required to restore a system to normal operation after an incident or failure. | https://dora.dev/ |
| Multi-Agent System | Architecture where multiple AI agents collaborate to solve complex problems or perform tasks. | https://www.anthropic.com/research/agents |
| Namespace | Kubernetes logical isolation mechanism for partitioning cluster resources among multiple users or teams. | https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/ |
| Natural Language Processing (NLP) | AI field focused on enabling computers to understand and process human language. | https://huggingface.co/ |
| Network Policy | Kubernetes resource for defining ingress and egress traffic rules between pods. | https://kubernetes.io/docs/concepts/services-networking/network-policies/ |
| npm | Package manager for JavaScript enabling installation and management of project dependencies. | https://www.npmjs.com/ |
| OCI (Open Container Initiative) | Open standards project defining container image, runtime, and distribution specifications. | https://opencontainers.org/ |
| On-Call | Operational practice where engineers are available outside normal hours to respond to incidents. | https://www.pagerduty.com/blog/on-call-best-practices/ |
| OpenCost | Open-source tool for monitoring and analyzing Kubernetes and cloud infrastructure costs. | https://www.opencost.io/ |
| OpenTelemetry (OTel) | Open-source standards and tools for instrumenting, collecting, and exporting telemetry data. | https://opentelemetry.io/ |
| OTel Collector | Component of OpenTelemetry that receives, processes, and exports telemetry data. | https://opentelemetry.io/docs/collector/ |
| OPA (Open Policy Agent) | General-purpose policy engine enabling policy as code across infrastructure and applications. | https://www.openpolicyagent.org/ |
| OpsLevel | Developer platform providing software catalog, service ownership, and maturity tracking. | https://www.opslevel.com/ |
| Ownership Boundaries | Clear delineation of which team owns specific services, platforms, or infrastructure components. | https://teamtopologies.com/key-concepts |
| Paved Roads | Recommended, pre-configured paths and patterns for common development and deployment tasks. | https://humanitec.com/blog/golden-paths |
| pip3 | Package manager for Python enabling installation and management of Python packages. | https://pip.pypa.io/ |
| Pod | Smallest deployable unit in Kubernetes, typically containing one or more containers. | https://kubernetes.io/docs/concepts/workloads/pods/ |
| Pod Disruption Budget (PDB) | Kubernetes resource defining minimum availability for pods during voluntary disruptions. | https://kubernetes.io/docs/tasks/run-application/configure-pdb/ |
| Policy as Code | Practice of encoding organizational policies and compliance requirements as machine-readable code. | https://www.openpolicyagent.org/ |
| Port (developer portal) | Developer platform providing software catalog, service tracking, and operational insights. | https://www.getport.io/ |
| Postmortem | Documentation of an incident including what happened, why it happened, and lessons learned. | https://www.pagerduty.com/blog/postmortem-process/ |
| Predictive Analytics | Use of ML and data analysis to forecast future outcomes and trends. | https://scikit-learn.org/stable/modules/ensemble.html |
| pre-commit | Framework for managing git hooks enabling code quality checks before commits. | https://pre-commit.com/ |
| Production Readiness | Assessment and certification that a system meets requirements for running in production. | https://cloud.google.com/blog/products/gcp/production-readiness-checklist |
| Prometheus | Open-source monitoring and alerting system collecting metrics from applications and infrastructure. | https://prometheus.io/ |
| prometheus_client (Python library) | Python library for instrumenting applications with Prometheus metrics. | https://github.com/prometheus/client_python |
| Provenance | Information about the origin, creation, and modifications of software artifacts and dependencies. | https://slsa.dev/ |
| Pull Request (PR) | Mechanism for proposing, reviewing, and merging code changes in Git-based workflows. | https://docs.github.com/en/pull-requests |
| Pulumi | Infrastructure as code platform enabling cloud resource definition using programming languages. | https://www.pulumi.com/ |
| Pulumi Operator | Kubernetes operator enabling automation of Pulumi infrastructure deployments. | https://github.com/pulumi/pulumi-kubernetes-operator |
| PyYAML | Python library for parsing and generating YAML configuration files. | https://pyyaml.org/ |
| Python 3 | Modern version of the Python programming language used for scripting and application development. | https://www.python.org/ |
| RAG (Retrieval-Augmented Generation) | AI technique combining information retrieval with generative models for more accurate responses. | https://arxiv.org/abs/2005.11401 |
| RBAC (Role-Based Access Control) | Kubernetes authorization system controlling which actions authenticated users can perform on resources. | https://kubernetes.io/docs/reference/access-authn-authz/rbac/ |
| Rego (OPA policy language) | Domain-specific language used to write Open Policy Agent policies and rules. | https://www.openpolicyagent.org/docs/latest/policy-language/ |
| Remediation Agent | AI agent specialized in providing and executing fixes for identified system issues. | https://www.anthropic.com/research/agents |
| Reusable Workflows (workflow_call) | GitHub Actions feature enabling creation of workflows that can be called by other workflows. | https://docs.github.com/en/actions/using-workflows/reusing-workflows |
| ResourceQuota | Kubernetes resource limiting total resource consumption within a namespace. | https://kubernetes.io/docs/concepts/policy/resource-quotas/ |
| Retry with Exponential Backoff | Resilience pattern for retrying failed operations with increasing delays between attempts. | https://aws.amazon.com/blogs/architecture/exponential-backoff-and-jitter/ |
| ROI (Return on Investment) | Metric measuring financial return generated by investments or initiatives. | https://www.finops.org/ |
| Runbook | Document containing step-by-step procedures for operating, troubleshooting, or maintaining a system. | https://www.pagerduty.com/resources/learn/runbook/ |
| SAST (Static Application Security Testing) | Security testing technique analyzing source code for vulnerabilities without executing it. | https://owasp.org/www-community/Source_Code_Analysis_Tools |
| SBOM (Software Bill of Materials) | Inventory of components, dependencies, and libraries used in software, critical for supply chain security. | https://www.cisa.gov/sbom |
| Scaffolder (Backstage) | Backstage feature enabling creation of new software components through templates and automation. | https://backstage.io/docs/features/software-templates/scaffolder-overview |
| scikit-learn | Python library providing machine learning algorithms and tools for data analysis. | https://scikit-learn.org/stable/ |
| Secret | Kubernetes object for storing sensitive data like passwords, API keys, and tokens. | https://kubernetes.io/docs/concepts/configuration/secret/ |
| Self-Service | Capability enabling developers to independently perform tasks without requiring manual intervention from platform teams. | https://humanitec.com/blog/self-service-infrastructure |
| Service | Kubernetes object exposing a set of pods as a network service within or outside the cluster. | https://kubernetes.io/docs/concepts/services-networking/service/ |
| Service Mesh | Infrastructure layer managing service-to-service communication with features like traffic management and observability. | https://istio.io/ |
| Shift-Left | Practice of moving security and quality checks earlier in the development lifecycle. | https://www.atlassian.com/continuous-delivery/shift-left |
| Showback / Chargeback | FinOps practice of allocating cloud costs to teams and business units for accountability. | https://www.finops.org/perspective/cost-allocation/ |
| SLA (Service Level Agreement) | Contractual commitment defining service availability, performance, and support levels. | https://www.site-reliability-engineering.info/sla-vs-slo-vs-sli/ |
| SLSA (Supply-chain Levels for Software Artifacts) | Framework for securing software supply chain through artifact provenance and integrity. | https://slsa.dev/ |
| SLI (Service Level Indicator) | Measurable metric quantifying a specific aspect of service level or performance. | https://www.site-reliability-engineering.info/sla-vs-slo-vs-sli/ |
| SLO (Service Level Objective) | Target value or range for a service level indicator defining acceptable service performance. | https://www.site-reliability-engineering.info/sla-vs-slo-vs-sli/ |
| Sloth | Tool for generating SLO configurations from Prometheus metrics and alerts. | https://sloth.dev/ |
| Software Catalog | Centralized inventory of an organization's software services, components, and their metadata. | https://backstage.io/docs/features/software-catalog/ |
| Software Templates (Backstage) | Backstage feature providing templates for creating new services and components consistently. | https://backstage.io/docs/features/software-templates/ |
| SPACE Framework | Framework for holistically measuring developer productivity across five dimensions: Satisfaction, Performance, Activity, Collaboration, Efficiency. | https://queue.acm.org/detail.cfm?id=3454124 |
| Spacelift | Platform for managing infrastructure as code with support for Terraform, Pulumi, and other IaC tools. | https://spacelift.io/ |
| Spotify Model (Squads, Tribes, Chapters, Guilds) | Organizational structure model organizing teams into squads, tribes, chapters, and guilds for scaling. | https://spotify.engineering/scaling-agile-at-spotify/ |
| SRE (Site Reliability Engineering) | Discipline applying software engineering to infrastructure and operations for reliability and scalability. | https://sre.google/ |
| Stream-Aligned Team | Team topology organized around a single business capability or value stream. | https://teamtopologies.com/key-concepts |
| Structured Logging (Logs) | Practice of emitting logs in structured, machine-readable formats for easier parsing and analysis. | https://opentelemetry.io/docs/concepts/signals/logs/ |
| Supply Chain Security | Practices for securing the entire software development and deployment pipeline. | https://slsa.dev/ |
| 30/60/90 Day Roadmap | Strategic planning tool defining goals and milestones for the first 30, 60, and 90 days. | https://www.indeed.com/career-advice/career-development/90-day-plan |
| Technical Debt | Accumulated cost of shortcuts and suboptimal decisions that require future effort to address. | https://martinfowler.com/bliki/TechnicalDebt.html |
| TechDocs (Backstage) | Backstage feature for hosting and discovering technical documentation alongside software components. | https://backstage.io/docs/features/techdocs/ |
| Team Topologies | Framework for organizing software delivery teams around business capabilities and interaction patterns. | https://teamtopologies.com/ |
| Terraform | Popular infrastructure as code tool enabling definition of cloud resources using declarative configuration. | https://www.terraform.io/ |
| TF-IDF (Term Frequency–Inverse Document Frequency) | Statistical measure used in natural language processing for evaluating word importance in documents. | https://scikit-learn.org/stable/modules/feature_extraction.html#tfidf |
| Toil | Repetitive, manual operational work that doesn't add lasting value and should be automated. | https://sre.google/sre-book/eliminating-toil/ |
| Triage Agent | AI agent specialized in classifying, prioritizing, and routing issues to appropriate teams or systems. | https://www.anthropic.com/research/agents |
| Trivy | Open-source security scanner for vulnerabilities in container images and infrastructure as code. | https://aquasecurity.github.io/trivy/ |
| Value-Complexity Matrix (VCM) | Framework for prioritizing platform features based on their value delivery and implementation complexity. | https://humanitec.com/blog/value-complexity-matrix |
| Value Stream Mapping (VSM) | Lean technique for visualizing and analyzing workflow to identify inefficiencies and improvements. | https://www.atlassian.com/team-playbook/plays/value-stream-mapping |
| Vector Database | Specialized database optimized for storing and querying high-dimensional embeddings for AI applications. | https://www.pinecone.io/learn/vector-database/ |
| Velero | Open-source tool for backup and disaster recovery of Kubernetes clusters and persistent data. | https://velero.io/ |
| VPA (Vertical Pod Autoscaler) | Kubernetes controller that recommends and automatically adjusts CPU and memory requests for containers. | https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler |

---

**Last Updated:** 2026-04-20  
**Course:** Building an AI-Powered Internal Developer Platform from Scratch  
**Instructor:** Ajay Chankramath
