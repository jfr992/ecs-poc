include "root" {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  subnets        = dependency.network.outputs.private_subnet_ids
  service_sg     = dependency.network.outputs.ecs_tasks_sg_id
  tg_arn         = dependency.network.outputs.app_target_group_arn
  app_count      = "2"
  app_port       = "8000"
  fargate_cpu    = "1024"
  fargate_memory = "2048"

}