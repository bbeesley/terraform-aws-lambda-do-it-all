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

  vpc_access_policy = [
    {
      Effect = "Allow"
      Action = [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface"
      ],
      Resource = [
        "*"
      ]
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

  policies_with_dlq    = var.vpc_subnets == null ? concat(local.logging_policy, local.dlq_policy, var.policies) : concat(local.logging_policy, local.dlq_policy, local.vpc_access_policy, var.policies)
  policies_without_dlq = var.vpc_subnets == null ? concat(local.logging_policy, var.policies) : concat(local.logging_policy, local.vpc_access_policy, var.policies)

  policies = var.dead_letter_target == null ? local.policies_without_dlq : local.policies_with_dlq
}
