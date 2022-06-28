variable "test_function_name" {
  description = "Name of the lambda function"
  type = string
  default = "test_lambda_function"
}

variable "test_source_file" {
  description = "location of the executable file in local"
  type = string
  default = "lambda/scripts/welcome_test.zip"
}

variable "test_file_name" {
  description = "name of the file"
  type = string
  default = "scripts/lambda/welcome_test.zip"
}

variable "bucket_id" {
  type = string
  description = "name of the bucket"
  default = "lambda-test-bucket-2022"
}

variable "api_function_name" {
  description = "Name of the lambda function"
  type = string
  default = "lambda-api-function"
}

variable "api_source_file" {
  description = "location of the executable file in local"
  type = string
  default = "lambda/scripts/api_test.zip"
}

variable "api_file_name" {
  description = "name of the file"
  type = string
  default = "scripts/lambda/api_test.zip"
}

variable "api_gateway_arn" {
  type = string
  description = "arn of the apigateway"
  default = ""
}

variable "lambda_role" {
  type = string
  default = ""
}