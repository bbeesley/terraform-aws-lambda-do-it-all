locals {
  environment = merge(
    var.environment_vars,
    {
      "FUNCTION_NAME" = var.name
    },
    {
      "FUNCTION_TIMEOUT" = var.timeout
    },
  )

  logging_policy = [
    {
      Action = [
        "logs:PutLogEvents"
      ]
      Resource = [
        "arn:aws:logs:${var.aws_region}:${var.aws_profile}:log-group:/aws/lambda/${var.name}:*:*"
      ]
      Effect = "Allow"
    }
  ]
}
