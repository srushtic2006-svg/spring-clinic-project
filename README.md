# Spring Petclinic DevSecOps Pipeline

An automated end-to-end CI/CD and DevSecOps pipeline implementation for the Spring Petclinic Java application, built with zero-cost cloud architecture.

## Architecture & Tech Stack
- **Infrastructure as Code (IaC):** Terraform (AWS EC2, EBS, Security Groups)
- **Configuration Management:** Ansible (Docker engine setup & SonarQube deployment)
- **CI/CD Orchestration:** Jenkins Declarative Pipeline (`Jenkinsfile`)
- **Static Application Security Testing (SAST):** SonarQube
- **Containerization:** Docker & Docker Hub

## Repository Layout
```text
.
├── terraform/          # Infrastructure provisioning scripts (main.tf, outputs.tf, variables.tf)
├── ansible/            # Host setup playbooks and dynamic inventory (inventory.ini, playbook.yml)
├── Jenkinsfile         # CI/CD pipeline definition (Build, SAST, Dockerize)
└── src/                # Spring Boot application source code

