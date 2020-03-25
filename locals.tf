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

  dlq_policy = [
    {
      Action = [
        var.dead_letter_target_type == "SQS" ? "sqs:SendMessage" : "sns:Publish"
      ]
      Resource = [
        var.dead_letter_target
      ]
      Effect = "Allow"
    }
  ]

  policies = var.dead_letter_target == null ? concat(local.logging_policy, var.policies) : concat(local.logging_policy, local.dlq_policy, var.policies)
}
