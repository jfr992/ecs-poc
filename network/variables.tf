
variable "vpc_cidr_block" {
  type        = string
  description = "cidr for vpc"
}

variable "az_count" {
    description = "Number of AZs to cover in a given region"
    default = "2"
}


variable "app_port" {
    description = "Port exposed by the docker image to redirect traffic to"
    default = 3000

}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
    description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
    default = "1024"
}

variable "fargate_memory" {
    description = "Fargate instance memory to provision (in MiB)"
}