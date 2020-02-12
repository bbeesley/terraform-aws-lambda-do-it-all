output "arn" {
  value = aws_lambda_function.lambda.arn
}

output "alias" {
  value = aws_lambda_alias.alias[var.alias].name
}

output "version" {
  value = aws_lambda_function.lambda.version
}

