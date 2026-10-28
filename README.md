# Cloud Foundation Lab (`cloud-inspector`)

Repozytorium laboratoryjne łączące inżynierię oprogramowania w Pythonie, konteneryzację, Infrastructure as Code (Terraform), Kubernetes (GKE + Kustomize) oraz bezpieczne CI/CD (GitHub Actions + OIDC).

## Struktura projektu

```text
cloud-foundation-lab/
├── .github/
│   └── workflows/
│       └── deploy.yml          # Pipeline CI/CD z OIDC (Tydzień 0.4)
├── infra/
│   ├── modules/
│   │   └── vpc-network/        # Własny moduł sieciowy (Tydzień 0.2)
│   ├── main.tf                 # VPC, IAM, GKE, Artifact Registry, WIF
│   ├── variables.tf            # Silnie typowane zmienne z walidacją
│   └── outputs.tf
├── k8s/
│   ├── base/                   # Deployment, Service, ConfigMap, PDB (Tydzień 0.3)
│   └── overlays/
│       └── dev/                # Kustomize overlay pod środowisko dev
├── src/
│   └── cloud_inspector/
│       ├── __init__.py
│       ├── models.py           # Dataclasses (frozen=True, slots=True)
│       ├── exceptions.py       # Własna hierarchia wyjątków
│       ├── logger.py           # Strukturalne logowanie JSON + Context Manager
│       ├── checker.py          # Logika diagnostyczna
│       └── main.py             # Entrypoint HTTP/CLI i obsługiwanie SIGTERM
├── tests/
│   └── test_checker.py         # Testy pytest (fixtures, parametrize, mocks)
├── Dockerfile                  # Multi-stage, non-root, exec form PID 1
├── pyproject.toml              # Konfiguracja uv, ruff, mypy, pytest
└── README.md
```

## Szybki start (Lokalny development)

```bash
# Utworzenie środowiska i instalacja zależności deweloperskich przez uv
uv sync --extra dev

# Sprawdzenie formatowania i lintera
uv run ruff check .

# Statyczna kontrola typów
uv run mypy

# Uruchomienie testów jednostkowych
uv run pytest
```

## Etapy laboratorium

- **Tydzień 0.1 – Python & Docker**: Implementacja pakietu `cloud_inspector` (`models.py`, `exceptions.py`, `logger.py`, `checker.py`, `main.py`), testy w `pytest` oraz bezpieczny, wieloetapowy `Dockerfile`.
- **Tydzień 0.2 – Terraform (IaC)**: Budowa własnego modułu `vpc-network` oraz konfiguracja zasobów GCP (VPC, IAM, GKE, Artifact Registry, Workload Identity Federation).
- **Tydzień 0.3 – Kubernetes & Kustomize**: Przygotowanie manifestów bazowych w `k8s/base` (z naciskiem na `securityContext`, sondy i `PodDisruptionBudget`) oraz narzutu środowiskowego w `k8s/overlays/dev`.
- **Tydzień 0.4 – CI/CD z OIDC**: Konfiguracja potoku GitHub Actions w `.github/workflows/deploy.yml` wykorzystującego bezkluczowe uwierzytelnianie OIDC do GCP.

