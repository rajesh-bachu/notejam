variable "prefix" {
  default = "notejam"
}

variable "project" {
  default = "notejam-devops"
}

variable "contact" {
  default = "rb@rajeshbachu.com"
}

variable "ecr_image_api" {
  description = "ECR image for API"
  default     = "907600535816.dkr.ecr.eu-central-1.amazonaws.com/notejam:latest"
}