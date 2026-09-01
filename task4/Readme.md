# Task 4 - CI/CD Pipeline using GitHub Actions

## Objective

Create an automated CI/CD pipeline using GitHub Actions to build and test an application automatically on code pushes and Pull Requests.

## Tasks Completed

- Created a GitHub Actions workflow
- Configured automated CI/CD pipeline
- Triggered workflow on pushes to `main`
- Triggered workflow on Pull Requests to `main`
- Installed application dependencies automatically
- Tested the Flask application
- Built the Docker image automatically
- Tested the Docker container
- Monitored GitHub Actions workflow execution
- Practiced identifying and resolving pipeline failures
- Used GitHub Pull Request workflow

## Repository

GitHub Repository:

`https://github.com/optimus168/devops-basics`

## Project Structure

```text
devops-basics/
├── task1/
│   ├── app.py
│   ├── Dockerfile
│   ├── requirements.txt
│   └── README.md
│
├── task2/
│   └── README.md
│
├── task3/
│   └── README.md
│
├── task4/
│   └── README.md
│
└── .github/
    └── workflows/
        └── ci-cd.yml
```

## GitHub Actions Workflow

The workflow is stored at:

```text
.github/workflows/ci-cd.yml
```

The pipeline performs the following steps:

1. Checks out the repository code
2. Sets up Python 3.11
3. Installs application dependencies
4. Tests the Flask application
5. Builds the Docker image
6. Runs the Docker container
7. Tests the running application

## Workflow Configuration

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.11"

      - name: Install dependencies
        run: |
          cd task1
          pip install -r requirements.txt

      - name: Test application
        run: |
          cd task1
          python -m py_compile app.py

      - name: Build Docker image
        run: |
          cd task1
          docker build -t task1 .

      - name: Test Docker container
        run: |
          docker run -d -p 5000:5000 --name task1-container task1
          sleep 5
          curl http://localhost:5000
```

## Triggering the Pipeline

The workflow is automatically triggered when:

### Push

Code is pushed to the `main` branch.

```text
push → main → GitHub Actions
```

### Pull Request

A Pull Request is created targeting the `main` branch.

```text
feature branch → Pull Request → main → GitHub Actions
```

## Pull Request Workflow

A separate branch was used to test the CI/CD workflow.

The branch was pushed to GitHub and a Pull Request was created:

```text
task2-update → main
```

The GitHub Actions pipeline automatically executed when the Pull Request was created.

After successful checks, the Pull Request was merged into `main`.

## Monitoring the Pipeline

Workflow execution can be monitored from:

```text
GitHub Repository
      ↓
Actions
      ↓
CI/CD Pipeline
```

A successful workflow displays a green check mark.

## Handling Pipeline Failures

Pipeline failures can be identified from the GitHub Actions workflow logs.

The failed step can be opened to inspect the error. After fixing the problem, the changes are committed and pushed again, causing GitHub Actions to run automatically.

Example workflow:

```text
Pipeline Failure
      ↓
Check GitHub Actions Logs
      ↓
Identify Problem
      ↓
Fix Code/Configuration
      ↓
Commit & Push
      ↓
Pipeline Runs Again
      ↓
Successful Build ✓
```

## Useful Git Commands

Check repository status:

```bash
git status
```

View branches:

```bash
git branch
```

View commit history:

```bash
git log --oneline
```

Push changes:

```bash
git push
```

Create a branch:

```bash
git switch -c feature-branch
```

## Bonus

The pipeline can be extended to automatically deploy the application to a cloud platform after successful builds.

Possible deployment platforms include:

- Render
- Railway
- AWS
- Azure
- Google Cloud

Cloud deployment was not required for the core implementation.

## Result

A working CI/CD pipeline was successfully created using GitHub Actions. The pipeline automatically checks out the code, installs dependencies, tests the Flask application, builds the Docker image, runs the container, and verifies the application.

The workflow is triggered automatically by pushes and Pull Requests, demonstrating a basic GitHub-based CI/CD workflow.