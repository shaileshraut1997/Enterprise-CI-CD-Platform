# Datadog Monitoring & Observability

This directory contains the Datadog monitoring configuration for the
Enterprise CI/CD Platform.

The application runs as a Java Spring Boot application inside Kubernetes.
Datadog is used to monitor infrastructure, containers, application
performance, errors, and operational health.

---

## Monitoring Architecture
===========================

                    Kubernetes Cluster
                           |
                +----------+----------+
                |                     |
             Pods                 Services
                |
                v
         Datadog Agent
                |
                v
             Datadog
                |
       +--------+--------+
       |        |        |
       v        v        v
   Metrics     Logs     APM
       |        |        |
       +--------+--------+
                |
                v
           Dashboard
                |
                v
             Alerts
