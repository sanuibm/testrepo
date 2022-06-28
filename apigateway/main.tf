resource "aws_api_gateway_rest_api" "test_api" {
  name = var.api_name
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  policy = var.policy
}

resource "aws_api_gateway_resource" "test_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  parent_id = aws_api_gateway_rest_api.test_api.root_resource_id
  path_part = "testapiresource"
}

resource "aws_api_gateway_method" "test_api_method" {
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  resource_id = aws_api_gateway_resource.test_api_resource.id
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "test_api_intergration" {
  depends_on = [aws_api_gateway_method.test_api_method]
  http_method = aws_api_gateway_method.test_api_method.http_method
  resource_id = aws_api_gateway_resource.test_api_resource.id
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  type = "AWS"
  uri = var.lambda_arn
  integration_http_method = "POST"
}

resource "aws_api_gateway_method_response" "response_200" {
 rest_api_id = aws_api_gateway_rest_api.test_api.id
 resource_id = aws_api_gateway_resource.test_api_resource.id
 http_method = aws_api_gateway_method.test_api_method.http_method
 status_code = "200"
 response_models = { "application/json" = "Empty"}
}

resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  depends_on = [
     aws_api_gateway_integration.test_api_intergration
  ]
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  resource_id = aws_api_gateway_resource.test_api_resource.id
  http_method = aws_api_gateway_method.test_api_method.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code
 response_templates = {
 "application/json" = <<EOF
 
 EOF
 }
}

 resource "aws_api_gateway_deployment" "test_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.test_api_resource.id,
      aws_api_gateway_method.test_api_method.id,
      aws_api_gateway_integration.test_api_intergration.id,
    ]))
  }
 }

resource "aws_api_gateway_stage" "test_api_stage" {
  deployment_id = aws_api_gateway_deployment.test_api_deployment.id
  rest_api_id = aws_api_gateway_rest_api.test_api.id
  stage_name = "test"
}

