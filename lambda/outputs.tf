output "lambda_function_arn" {
  value = aws_lambda_function.lambda_api_function.invoke_arn
}