#!/bin/bash

# ============================================================
# Enterprise CI/CD Platform
# Kubernetes Deployment Script
# ============================================================

set -e

echo "=========================================="
echo " Enterprise CI/CD Platform - Deployment"
echo "=========================================="

# ------------------------------------------------------------
# Configuration
# ------------------------------------------------------------

NAMESPACE="enterprise-cicd"
DEPLOYMENT_NAME="enterprise-cicd-platform"

IMAGE_NAME="${IMAGE_NAME:-enterprise-cicd-platform}"
IMAGE_TAG="${IMAGE_TAG:-latest}"

FULL_IMAGE="${IMAGE_NAME}:${IMAGE_TAG}"

echo ""
echo "Namespace  : ${NAMESPACE}"
echo "Deployment : ${DEPLOYMENT_NAME}"
echo "Image      : ${FULL_IMAGE}"

# ------------------------------------------------------------
# Check Kubernetes
# ------------------------------------------------------------

echo ""
echo "Checking Kubernetes connection..."

kubectl cluster-info

# ------------------------------------------------------------
# Create / Update Namespace
# ------------------------------------------------------------

echo ""
echo "Applying Namespace..."

kubectl apply \
  -f kubernetes/namespace.yaml

# ------------------------------------------------------------
# Apply ConfigMap
# ------------------------------------------------------------

echo ""
echo "Applying ConfigMap..."

kubectl apply \
  -f kubernetes/configmap.yaml

# ------------------------------------------------------------
# Apply Secret
# ------------------------------------------------------------

echo ""
echo "Applying Secret..."

kubectl apply \
  -f kubernetes/secret.yaml

# ------------------------------------------------------------
# Apply Deployment
# ------------------------------------------------------------

echo ""
echo "Applying Deployment..."

kubectl apply \
  -f kubernetes/deployment.yaml

# ------------------------------------------------------------
# Update Docker Image
# ------------------------------------------------------------

echo ""
echo "Updating application image..."

kubectl set image \
  deployment/${DEPLOYMENT_NAME} \
  ${DEPLOYMENT_NAME}=${FULL_IMAGE} \
  -n ${NAMESPACE}

# ------------------------------------------------------------
# Apply Service
# ------------------------------------------------------------

echo ""
echo "Applying Service..."

kubectl apply \
  -f kubernetes/service.yaml

# ------------------------------------------------------------
# Apply Ingress
# ------------------------------------------------------------

echo ""
echo "Applying Ingress..."

kubectl apply \
  -f kubernetes/ingress.yaml

# ------------------------------------------------------------
# Wait for Rollout
# ------------------------------------------------------------

echo ""
echo "Waiting for Kubernetes rollout..."

kubectl rollout status \
  deployment/${DEPLOYMENT_NAME} \
  -n ${NAMESPACE} \
  --timeout=180s

# ------------------------------------------------------------
# Deployment Information
# ------------------------------------------------------------

echo ""
echo "=========================================="
echo " Deployment Successful"
echo "=========================================="

echo ""
echo "Pods:"
kubectl get pods \
  -n ${NAMESPACE}

echo ""
echo "Service:"
kubectl get service \
  -n ${NAMESPACE}

echo ""
echo "Deployment:"
kubectl get deployment \
  -n ${NAMESPACE}
