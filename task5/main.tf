terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Download Nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create Docker network
resource "docker_network" "task5_network" {
  name = "task5-network"
}

# Create persistent storage
resource "docker_volume" "task5_storage" {
  name = "task5-storage"
}

# Create Nginx container
resource "docker_container" "task5_server" {
  name  = "task5-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = docker_network.task5_network.name
  }

  volumes {
    volume_name    = docker_volume.task5_storage.name
    container_path = "/usr/share/nginx/html"
  }
}

output "website_url" {
  value = "http://localhost:8080"
}