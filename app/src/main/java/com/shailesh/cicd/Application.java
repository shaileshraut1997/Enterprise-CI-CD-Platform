package com.shailesh.cicd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    // Home endpoint
    @GetMapping("/health")
    public String health() {
        return "Enterprise CI/CD Platform is running successfully";
    }

    // Application information
    @GetMapping("/info")
    public String info() {
        return "Enterprise CI/CD Platform - Java Spring Boot";
    }

    // Application status
    @GetMapping("/status")
    public String status() {
        return "Application Status: UP";
    }
}
