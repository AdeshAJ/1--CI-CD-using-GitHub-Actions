# 🚀 DevOps Task 1 — Automate Code Deployment Using CI/CD (GitHub Actions)




## 🧩 Objective
Set up a **CI/CD pipeline** to automatically build, test, and deploy a sample **Node.js web app** using **GitHub Actions** and **Docker**.

---

## ⚙️ Tools & Technologies
- **GitHub**
- **GitHub Actions**
- **Node.js**
- **Docker**
- **Docker Hub**

---

## 🏗️ Project Workflow

1. **Clone the repository**
   ```bash
   git clone <your-repo-link>
   cd <repo-name>
   ```

2. **Set up a Node.js app**
   Include a simple Node.js demo app (e.g., Express server).

3. **Dockerize the app**
   Create a `Dockerfile` and build an image:
   ```bash
   docker build -t <your-dockerhub-username>/nodejs-demo-app .
   ```

4. **Configure GitHub Actions**
   Add this workflow file:  
   `.github/workflows/main.yml`

   This workflow will:
   - Install dependencies  
   - Run tests  
   - Build the Docker image  
   - Push it to DockerHub  
   - Optionally deploy (if configured)

---

## 🧠 Key CI/CD Concepts

| Concept | Description |
|----------|--------------|
| **CI (Continuous Integration)** | Automatically builds and tests code changes when pushed. |
| **CD (Continuous Deployment)** | Automatically deploys tested code to production or staging. |
| **Runners** | Virtual machines where GitHub Actions execute jobs. |
| **Jobs** | Groups of steps that run in the same runner. |
| **Steps** | Individual commands or actions in a job. |
| **Secrets** | Securely store credentials like DockerHub tokens. |

---

## 🔐 GitHub Secrets Used

| Secret Name | Purpose |
|--------------|----------|
| `DOCKER_USERNAME` | DockerHub username |
| `DOCKER_PASSWORD` | DockerHub access token |

---

## 🧪 Trigger
This workflow runs automatically when you **push to the `main` branch**:
```yaml
on:
  push:
    branches:
      - main
```

---

## 🧾 Example Workflow (`.github/workflows/main.yml`)
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [ "main" ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '18'

    - name: Install dependencies
      run: npm install

    - name: Run tests
      run: npm test

    - name: Build Docker image
      run: docker build -t ${{ secrets.DOCKER_USERNAME }}/nodejs-demo-app .

    - name: Log in to DockerHub
      run: echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin

    - name: Push Docker image
      run: docker push ${{ secrets.DOCKER_USERNAME }}/nodejs-demo-app
```

---

## ✅ Outcome
By completing this task, you have:
- Automated build, test, and deployment.
- Created a working CI/CD pipeline with GitHub Actions.
- Integrated Docker into the pipeline.

---


## 🧰 Optional (Local Testing)
To test the pipeline locally using [`act`](https://github.com/nektos/act):
```bash
act push
```
