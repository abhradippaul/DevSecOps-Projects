# 🚀 CI/CD Pipeline with Jenkins, SonarQube, Trivy, OWASP, Docker & ArgoCD

![Jenkins](https://img.shields.io/badge/Jenkins-Automation-blue?logo=jenkins)
![Docker](https://img.shields.io/badge/Docker-Container-blue?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-blue?logo=kubernetes)
![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-orange?logo=argo)
![SonarQube](https://img.shields.io/badge/SonarQube-Code%20Quality-yellow?logo=sonarqube)
![Trivy](https://img.shields.io/badge/Trivy-Security-critical?logo=aqua)

---

## 📌 Overview

This project demonstrates a complete **CI/CD pipeline** using **Jenkins** running on Docker agents. It incorporates modern DevSecOps practices using **SonarQube**, **Trivy**, and **OWASP Dependency Check** for robust quality and security checks. Final deployment is managed through **ArgoCD** using GitOps principles.

---

## 🔧 Tools & Technologies

| Tool         | Purpose                                |
|--------------|----------------------------------------|
| Jenkins      | Automation server for CI/CD            |
| Docker       | Containerization and image builds      |
| GitHub       | Source code repository                 |
| SonarQube    | Code quality and static analysis       |
| Trivy        | Vulnerability scanning                 |
| OWASP        | Dependency check                       |
| Docker Hub   | Image registry                         |
| Kubernetes   | Container orchestration                |
| ArgoCD       | Continuous deployment via GitOps       |

---

## 🧪 Pipeline Steps

![Screenshot 2025-04-20 001701](https://github.com/user-attachments/assets/b06f6dc8-af5d-496e-a85f-86cae3271fe4)

1. **Checkout Code**  
   Jenkins fetches the latest code from GitHub.

2. **Static Code Analysis**  
   - Runs **SonarQube Scanner**
   - Enforces **SonarQube Quality Gate**  
   ❌ If the gate fails, the pipeline is terminated.

3. **Filesystem Scanning**  
   - Uses **Trivy** to scan source code for filesystem vulnerabilities.

4. **Dependency Scanning**  
   - Performs OWASP dependency check for known CVEs.

5. **Build Docker Image**  
   - Creates a Docker image with the application code.

6. **Image Scanning**  
   - Scans the newly built image using **Trivy**.

7. **Push to Docker Hub**  
   - Tags and pushes the Docker image to Docker Hub.

8. **Update Kubernetes Manifest**  
   - Updates the image tag in the manifest YAML.

9. **Trigger ArgoCD**  
   - ArgoCD detects the Git change and redeploys the K8s resources.

![Screenshot 2025-04-20 000236](https://github.com/user-attachments/assets/c65e40bb-9d99-477f-85d8-062dc2abd009)

---

## Ouput

![Screenshot 2025-04-19 235330](https://github.com/user-attachments/assets/cd8e2935-11c4-4684-bf8c-4887f5a87154)
![Screenshot 2025-04-19 235347](https://github.com/user-attachments/assets/77784823-c171-466b-9d6f-842e51a544d9)

---

## 📁 Folder Structure

```bash
.
├── Jenkinsfile
├── Dockerfile
├── sonar-project.properties
├── deployment/
│   └── k8s-manifest.yaml
├── .github/
│   └── workflows/
├── scripts/
│   ├── trivy-scan.sh
│   └── owasp-scan.sh
├── manifests/   
├── template/
├── frontend/   
├── backend/  
