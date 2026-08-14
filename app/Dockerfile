# ============================================================
# Stage 1: Build the Java application
# ============================================================

FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copy Maven configuration first
# This improves Docker layer caching
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy application source code
COPY src ./src

# Build the Spring Boot application
RUN mvn clean package -DskipTests


# ============================================================
# Stage 2: Run the application
# ============================================================

FROM eclipse-temurin:21-jre

WORKDIR /app

# Create a non-root user
RUN useradd --system --uid 1001 appuser

# Copy only the generated JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Give application user ownership
RUN chown appuser:appuser app.jar

# Run container as non-root user
USER appuser

# Spring Boot application port
EXPOSE 8080

# JVM configuration
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75.0"

# Start application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
