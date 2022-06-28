module "role" {
  source = "./roles"
}

module "lambda" {
  source = "./lambda"
  lambda_role = module.role.lambda_role_arn
  api_gateway_arn = module.apigateway.api_gateway_arn
}

module "apigateway" {
  source = "./apigateway"
  lambda_arn = module.lambda.lambda_function_arn

}