include "root" {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr_block = "172.17.0.0/16"
  az_count       = "2"
  fargate_memory = "1024"
}