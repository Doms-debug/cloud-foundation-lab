# Cloud Foundation Lab (`cloud-inspector`)

Hands-on lab repository combining production-grade Python software engineering, containerization, Infrastructure as Code (Terraform), Kubernetes (GKE + Kustomize), and keyless CI/CD (GitHub Actions + OIDC).

## Project Structure

```text
cloud-foundation-lab/
├── .github/
│   └── workflows/
│       └── deploy.yml          # CI/CD pipeline with OIDC (Week 0.4)
├── infra/
│   ├── modules/
│   │   └── vpc-network/        # Custom network module (Week 0.2)
│   ├── main.tf                 # VPC, IAM, GKE, Artifact Registry, WIF
│   ├── variables.tf            # Strongly-typed variables with validation
│   └── outputs.tf
├── k8s/
│   ├── base/                   # Deployment, Service, ConfigMap, PDB (Week 0.3)
│   └── overlays/
│       └── dev/                # Kustomize overlay for the dev environment
├── src/
│   └── cloud_inspector/
│       ├── __init__.py
│       ├── models.py           # Dataclasses (frozen=True, slots=True)
│       ├── exceptions.py       # Custom exception hierarchy
│       ├── logger.py           # Structured JSON logging + Context Manager
│       ├── checker.py          # Diagnostic logic
│       └── main.py             # HTTP/CLI entrypoint and SIGTERM handling
├── tests/
│   └── test_checker.py         # pytest unit tests (fixtures, parametrize, mocks)
├── Dockerfile                  # Multi-stage, non-root, exec form PID 1
├── pyproject.toml              # Configuration for uv, ruff, mypy, pytest
└── README.md
```

## Quick Start (Local Development)

```bash
# Create virtual environment and install dev dependencies using uv
uv sync --extra dev

# Run linter and formatter checks
uv run ruff check .

# Run static type checking
uv run mypy

# Run unit tests
uv run pytest
```

## Lab Roadmap

- **Week 0.1 – Python & Docker**: Implement the `cloud_inspector` package (`models.py`, `exceptions.py`, `logger.py`, `checker.py`, `main.py`), unit tests in `pytest`, and a hardened multi-stage `Dockerfile`.
- **Week 0.2 – Terraform (IaC)**: Build a custom `vpc-network` module and provision GCP infrastructure (VPC, IAM, GKE, Artifact Registry, Workload Identity Federation).
- **Week 0.3 – Kubernetes & Kustomize**: Author base manifests in `k8s/base` (focusing on `securityContext`, probes, resource limits, and `PodDisruptionBudget`) and environment overlays in `k8s/overlays/dev`.
- **Week 0.4 – CI/CD with OIDC**: Configure the GitHub Actions workflow in `.github/workflows/deploy.yml` using keyless OIDC authentication to GCP.
