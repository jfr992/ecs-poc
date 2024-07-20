output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "ecs_tasks_sg_id" {
  description = "The ID of the ECS tasks security group"
  value       = aws_security_group.ecs_tasks.id
}

output "app_target_group_arn" {
  description = "The ARN of the application target group"
  value       = aws_alb_target_group.app.arn
}