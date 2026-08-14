# Contributing to Enterprise CI/CD Platform

Thank you for your interest in contributing to the Enterprise CI/CD Platform.

This project is designed to demonstrate production-style DevOps practices including CI/CD automation, code quality, containerization, security, Kubernetes deployment, and observability.

Contributions, improvements, bug fixes, documentation updates, and suggestions are welcome.

---

## 📋 Before You Start

Before contributing:

1. Read the project README.
2. Understand the project architecture.
3. Check existing issues and pull requests.
4. Avoid introducing unnecessary dependencies.
5. Never commit passwords, API keys, tokens, certificates, private keys, or other sensitive information.
6. Follow the existing project structure and coding standards.

---

## 🌿 Branching Strategy

Use descriptive branch names.

Examples:

```text
feature/add-health-check
feature/datadog-monitoring
fix/jenkins-deployment
fix/docker-build
docs/update-architecture
security/improve-container-scan
```

Recommended branch flow:

```text
main
  ↑
Pull Request
  ↑
feature/fix branch
```

The `main` branch should contain stable and reviewed code.

---

## 🔄 Pull Request Process

Before opening a Pull Request:

1. Create a new branch.
2. Make your changes.
3. Test the changes locally.
4. Run the required application tests.
5. Validate Docker builds successfully.
6. Run applicable security and code-quality checks.
7. Update documentation when necessary.
8. Commit your changes with a meaningful commit message.
9. Push your branch.
10. Open a Pull Request against `main`.

---

## 🧪 Testing Requirements

Changes should be tested before submission.

Application changes should include appropriate tests.

Example:

```bash
pytest
```

Docker changes should be validated with:

```bash
docker build .
```

Kubernetes manifests should be validated before deployment.

CI/CD changes should be tested through the appropriate pipeline.

---

## 🔐 Security Requirements

Security is a core requirement of this project.

Do not commit:

* Passwords
* API keys
* Access tokens
* AWS credentials
* Private SSH keys
* TLS private keys
* Production configuration
* Kubernetes production secrets
* `.env` files containing sensitive values

Use environment variables, CI/CD secret stores, or appropriate secret-management solutions instead.

Security-related changes should be reviewed carefully before merging.

---

## 🐳 Docker Guidelines

Dockerfiles should follow production-oriented practices.

Prefer:

* Small base images
* Multi-stage builds where appropriate
* Non-root containers
* Explicit dependency versions
* Health checks
* Minimal installed packages
* Proper `.dockerignore` usage

Docker images should be checked for known vulnerabilities before deployment.

---

## ☸️ Kubernetes Guidelines

Kubernetes changes should follow production best practices.

Where applicable, include:

* Resource requests and limits
* Liveness probes
* Readiness probes
* Appropriate labels and selectors
* Secure configuration
* Proper namespaces
* Least-privilege access
* Appropriate security settings

Never commit real production credentials or secrets.

---

## 🚀 CI/CD Guidelines

Changes to GitHub Actions or Jenkins pipelines should:

* Fail safely.
* Provide useful logs.
* Avoid exposing secrets.
* Validate application changes before deployment.
* Use explicit versions where practical.
* Avoid unnecessary pipeline steps.
* Keep deployment logic understandable and maintainable.

---

## 📊 Monitoring Guidelines

Changes affecting application behavior or infrastructure should consider monitoring requirements.

Where applicable, update:

* Datadog dashboards
* Datadog monitors
* Application metrics
* Logs
* Alerts
* Health checks
* Troubleshooting documentation

---

## 📝 Documentation

Documentation is part of the project.

If a change modifies architecture, deployment, configuration, troubleshooting, or operational behavior, update the relevant documentation.

Examples:

```text
docs/architecture.md
docs/cicd-flow.md
docs/deployment.md
docs/troubleshooting.md
docs/rca.md
```

---

## 💬 Commit Message Guidelines

Use clear and meaningful commit messages.

Examples:

```text
feat: add Docker build pipeline
fix: resolve Kubernetes deployment failure
docs: update CI/CD architecture
security: improve container scanning
test: add application health tests
refactor: simplify Jenkins deployment stage
```

Avoid messages such as:

```text
update
changes
final
test
abc
new code
```

---

## 🔎 Code Review

Pull Requests should be reviewed for:

* Correctness
* Security
* Maintainability
* Test coverage
* Performance
* Infrastructure impact
* Deployment impact
* Monitoring requirements
* Documentation

A Pull Request should be small enough to review effectively whenever possible.

---

## 🚨 Production Changes

Changes that can affect production deployment should be treated carefully.

Consider:

```text
Change
  ↓
Testing
  ↓
Code Review
  ↓
CI Validation
  ↓
Security Validation
  ↓
Deployment
  ↓
Monitoring
  ↓
Verification
```

Rollback procedures should be considered for changes that could cause service disruption.

---

## 🤝 Code of Conduct

Contributors are expected to communicate respectfully and professionally.

Constructive feedback, technical discussion, and different engineering opinions are welcome.

---

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the project's MIT License.
