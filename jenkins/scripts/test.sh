#!/bin/bash

# ============================================================
# Enterprise CI/CD Platform
# Test Script
# ============================================================

set -e

echo "=========================================="
echo " Enterprise CI/CD Platform - Test"
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
echo "Running JUnit tests..."

mvn clean test

echo ""
echo "=========================================="
echo " All tests passed successfully"
echo "=========================================="

echo ""
echo "Test reports:"
echo "app/target/surefire-reports/"
