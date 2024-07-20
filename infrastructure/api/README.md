<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.api_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.app_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_count"></a> [app\_count](#input\_app\_count) | n/a | `any` | n/a | yes |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | n/a | `any` | n/a | yes |
| <a name="input_fargate_cpu"></a> [fargate\_cpu](#input\_fargate\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_fargate_memory"></a> [fargate\_memory](#input\_fargate\_memory) | n/a | `any` | n/a | yes |
| <a name="input_service_sg"></a> [service\_sg](#input\_service\_sg) | n/a | `any` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_tg_arn"></a> [tg\_arn](#input\_tg\_arn) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->