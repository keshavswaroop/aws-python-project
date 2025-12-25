variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "app_name" {
  default = "prod-app"
}

variable "docker_image" {
  description = "DockerHub image"
#   default = "swaroops2803/aws-python-project:latest"
default = "101248947739.dkr.ecr.ap-south-1.amazonaws.com/prod-app:latest"
}
