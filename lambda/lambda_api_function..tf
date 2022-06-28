resource "aws_lambda_function" "lambda_api_function" {
  function_name = var.api_function_name
  handler = "api_test.lambda_handler"
  runtime = "python3.9"
  role = var.lambda_role
  s3_bucket = var.bucket_id
  s3_key = aws_s3_bucket_object.api_lambda_script_file.key
}

resource "aws_s3_bucket_object" "api_lambda_script_file" {
  key = var.api_file_name
  bucket = var.bucket_id
  source = var.api_source_file
  server_side_encryption = "aws:kms"
}

resource "aws_lambda_permission" "allow_api_gateway" {
  action = "lambda:InvokeFunction"
  function_name = var.api_function_name
  principal = "apigateway.amazonaws.com"
  source_arn = var.api_gateway_arn
}
  