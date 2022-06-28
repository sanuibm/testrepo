# resource "aws_lambda_function" "my_function" {
#   function_name = var.test_function_name
#   handler = "welcome_test.lambda_handler"
#   runtime = "python3.9"
#   role = "arn:aws:iam::684057613752:role/test_lambda_role"
#   s3_bucket = var.bucket_id
#   s3_key = aws_s3_bucket_object.lambda_script_file.key
# }

# resource "aws_s3_bucket_object" "lambda_script_file" {
#   key = var.test_file_name
#   bucket = var.bucket_id
#   source = var.test_source_file
#   server_side_encryption = "aws:kms"
# }