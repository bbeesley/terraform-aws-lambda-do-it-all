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

  default_assume_role_policy = [
    {
      Action = [
        "sts:AssumeRole"
      ]
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    },
  ]

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

  assume_role_policies = concat(local.default_assume_role_policy, var.additional_assume_role_policies)

  policies = var.dead_letter_target == null ? concat(local.logging_policy, var.policies) : concat(local.logging_policy, local.dlq_policy, var.policies)
}
