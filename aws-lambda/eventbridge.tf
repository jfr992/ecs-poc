resource "aws_cloudwatch_event_rule" "lambda_every_hour" {
  name                = "lambda-every-hour"
  description         = "Fires every hour"
  schedule_expression = "rate(1 hour)"
}

resource "aws_cloudwatch_event_target" "trigger_lambda_on_schedule" {
  rule      = aws_cloudwatch_event_rule.lambda_every_hour.name
  target_id = "lambda"
  arn       = aws_lambda_function.app_lambda.arn
}