output "arn" {
  description = "ARN for the lambda function"
  value = aws_lambda_function.lambda.arn
}

output "alias" {
  description = "Name of the lambda function alias"
  value = var.alias == null ? null : aws_lambda_alias.alias[var.alias].name
}

output "version" {
  description = "Current version of the lambda function"
  value = aws_lambda_function.lambda.version
}

output "role" {
  description = "Name of the lambda role"
  value = aws_iam_role.lambda_role.name
}
