output "arn" {
  description = "ARN for the lambda function"
  value       = aws_lambda_function.lambda.arn
}

output "qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = aws_lambda_function.lambda.qualified_arn
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = aws_lambda_function.lambda.invoke_arn
}

output "name" {
  description = "The lambda function name"
  value       = var.name
}

output "alias" {
  description = "Name of the lambda function alias"
  value       = var.alias
}

output "version" {
  description = "Current version of the lambda function"
  value       = aws_lambda_function.lambda.version
}

output "role" {
  description = "Name of the lambda role"
  value       = aws_iam_role.lambda_role.name
}
