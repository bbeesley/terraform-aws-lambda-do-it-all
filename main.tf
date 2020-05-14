resource "aws_iam_role" "lambda_role" {
  name = "${var.name}-lambda-role-${var.aws_region}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": ${jsonencode(local.assume_role_policies)}
}
EOF

}

resource "aws_iam_policy" "lambda_policy" {
  name        = "${var.name}-lambda-policy-${var.aws_region}"
  description = "IAM Policy for the ${var.name} lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": ${jsonencode(local.policies)}
}
EOF

}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_attachment_vpc_exec" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = var.log_retention
  tags              = var.tags
}

resource "aws_lambda_function" "lambda" {
  function_name                  = var.name
  role                           = aws_iam_role.lambda_role.arn
  handler                        = var.handler
  memory_size                    = var.memory_size
  runtime                        = var.lambda_runtime
  timeout                        = var.timeout
  tags                           = var.tags
  s3_bucket                      = var.s3_bucket
  s3_key                         = var.s3_key
  reserved_concurrent_executions = var.lambda_concurrency
  publish                        = var.publish
  layers                         = var.layers

  depends_on = [aws_cloudwatch_log_group.lambda]

  environment {
    variables = local.environment
  }

  dynamic "tracing_config" {
    for_each = var.tracing_config_mode == null ? toset([]) : toset([true])

    content {
      mode = var.tracing_config_mode
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_subnets == null ? toset([]) : toset([true])

    content {
      subnet_ids         = var.vpc_subnets
      security_group_ids = var.vpc_security_groups
    }
  }

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_target == null ? toset([]) : toset([true])

    content {
      target_arn = var.dead_letter_target
    }
  }
}

resource "aws_lambda_alias" "alias" {
  for_each         = var.alias == null ? toset([]) : toset([var.alias])
  name             = each.key
  description      = "points the trigger to a lambda version"
  function_name    = aws_lambda_function.lambda.arn
  function_version = aws_lambda_function.lambda.version
  lifecycle {
    ignore_changes = [
      function_version,
    ]
  }
}
