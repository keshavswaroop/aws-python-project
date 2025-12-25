variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "app_name" {
  default = "prod-app"
}

variable "docker_image" {
  description = "DockerHub image"
  # CHANGE THIS 👇
  default = "swaroops2803/aws-python-project:latest"
}
