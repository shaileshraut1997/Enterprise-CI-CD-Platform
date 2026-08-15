# Enterprise CI/CD Platform - Architecture

## Overview

The Enterprise CI/CD Platform is a production-oriented DevOps project
designed to demonstrate automated software delivery from source code
commit through testing, security validation, containerization,
Kubernetes deployment, and monitoring.

The application is built using Java Spring Boot and deployed as a
containerized workload on Kubernetes.

---

## High-Level Architecture
============================

                         Developer
                             |
                             v
                         GitHub
                             |
              +--------------+--------------+
              |                             |
              v                             v
      GitHub Actions                     Jenkins
              |                             |
       +------+-------+              +------+------+
       |              |              |             |
      Build          Test           Build        Deploy
       |              |              |             |
       +------+-------+              |             |
              |                      |             |
              v                      v             |
          SonarQube              Docker Build      |
              |                      |             |
              v                      v             |
        Code Quality            Docker Scout       |
                                     |             |
                                     v             |
                              Container Registry   |
                                     |             |
                                     +------+------+
                                            |
                                            v
                                      Kubernetes
                                            |
                         +------------------+------------------+
                         |                  |                  |
                         v                  v                  v
                      Pod 1               Pod 2               Pod 3
                         |                  |                  |
                         +------------------+------------------+
                                            |
                                            v
                                         Service
                                            |
                                            v
                                         Ingress
                                            |
                                            v
                                           User

Kubernetes
    |
    v
Datadog Agent
    |
    v
Datadog
    |
    +-- Metrics
    +-- Logs
    +-- APM
    +-- Dashboards
    +-- Alerts
