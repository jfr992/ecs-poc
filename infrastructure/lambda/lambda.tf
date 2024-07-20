locals {
  subnet_ids = jsondecode(var.subnets)
}

resource "aws_lambda_function" "app_lambda" {
  function_name    = "app"
  role             = aws_iam_role.api_lambda_role.arn
  s3_bucket        = aws_s3_bucket.app_bucket.id
  s3_key           = aws_s3_bucket_object.api_code_archive.key
  source_code_hash = data.archive_file.lambda.output_base64sha256

  architectures = ["arm64"]
  runtime       = "provided.al2"
  handler       = "bootstrap"
  memory_size   = 128
  publish       = true

  lifecycle {
    ignore_changes = [
      last_modified,
      source_code_hash,
      version,
      environment
    ]
  }

  vpc_config {
    subnet_ids         = local.subnet_ids
  }
}

resource "aws_lambda_alias" "app_lambda_alias" {
  name             = "production"
  function_name    = aws_lambda_function.app_lambda.arn
  function_version = "$LATEST"

  lifecycle {
    ignore_changes = [
      function_version
    ]
  }
}

resource "aws_cloudwatch_log_group" "api_lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.api_lambda.function_name}"
  retention_in_days = 14
  tags              = {}
}

resource "aws_iam_role" "api_lambda_role" {
  name = "example-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda-role-policy"
  role = aws_iam_role.api_lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}