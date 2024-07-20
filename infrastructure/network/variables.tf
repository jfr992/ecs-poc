
variable "vpc_cidr_block" {
  type        = string
  description = "cidr for vpc"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "health_check_path" {
  default = "/"
}

variable "app_port" {
  default = "8000"
}
