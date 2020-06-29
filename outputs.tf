output "arn" {
  description = "ARN for the lambda function"
  value = aws_lambda_function.lambda.arn
}

output "name" {
  description = "The lambda function name"
  value = var.name
}

output "alias" {
  description = "Name of the lambda function alias"
  value = var.alias
}

output "version" {
  description = "Current version of the lambda function"
  value = aws_lambda_function.lambda.version
}

output "role" {
  description = "Name of the lambda role"
  value = aws_iam_role.lambda_role.name
}
