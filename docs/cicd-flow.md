# CI/CD Flow

## Pipeline Overview

```text
Developer
   |
   v
Git Push / Pull Request
   |
   v
GitHub
   |
   v
GitHub Actions
   |
   +--> Build
   |
   +--> Unit Test
   |
   +--> SonarQube
   |
   +--> Docker Build
   |
   +--> Docker Scout
   |
   v
Jenkins
   |
   v
Kubernetes Deployment
   |
   v
Datadog Monitoring
