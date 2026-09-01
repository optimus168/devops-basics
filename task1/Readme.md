# Task 1 - Dockerized Web Application

## Objective

Create and run a containerized web application using Docker.

## Tasks Completed

- Installed Docker Desktop
- Created a simple Flask web application
- Created a `Dockerfile` to containerize the application
- Built the Docker image locally
- Ran the application inside a Docker container
- Verified the application through a web browser
- Mapped the container port to the host machine

## Project Structure

```text
task1/
├── app.py
├── Dockerfile
├── requirements.txt
└── README.md
```

## Application

The application is a simple Python Flask web server.

### `app.py`

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Hello from Docker!</h1><p>My web application is containerized.</p>"

app.run(host="0.0.0.0", port=5000)
```

## Dockerfile

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

## Build Docker Image

From the `task1` directory:

```bash
docker build -t task1 .
```

## Run Docker Container

```bash
docker run -d -p 5000:5000 --name my-container task1
```

The `-p 5000:5000` option maps port 5000 of the container to port 5000 of the host machine.

## Verify Application

Open the following URL in a browser:

```text
http://localhost:5000
```

The application displays:

> Hello from Docker!

## Verify Container

```bash
docker ps
```

This confirms that the Docker container is running.

## Useful Commands

Stop the container:

```bash
docker stop my-container
```

Start the container again:

```bash
docker start my-container
```

Remove the container:

```bash
docker rm my-container
```

List Docker images:

```bash
docker images
```

## Result

The Flask web application was successfully containerized using Docker, built into a Docker image, executed inside a container, and accessed through a web browser using `localhost:5000`.