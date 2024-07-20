include "root" {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../infrastructure/network"
}

inputs = {
  subnets    = dependency.network.outputs.private_subnet_ids
  service_sg = dependency.network.outputs.ecs_tasks_sg_id

}