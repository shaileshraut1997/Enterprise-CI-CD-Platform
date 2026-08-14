#!/bin/bash

# ============================================================
# Enterprise CI/CD Platform
# Build Script
# ============================================================

set -e

echo "=========================================="
echo " Enterprise CI/CD Platform - Build"
echo "=========================================="

echo ""
echo "Checking Java version..."
java -version

echo ""
echo "Checking Maven version..."
mvn -version

echo ""
echo "Moving to application directory..."

cd app

echo ""
echo "Starting Maven build..."

mvn clean package -DskipTests

echo ""
echo "=========================================="
echo " Build completed successfully"
echo "=========================================="

echo ""
echo "Generated JAR file:"

ls -lh target/*.jar
