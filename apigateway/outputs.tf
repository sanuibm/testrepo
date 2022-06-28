output "api_gateway_arn" {
  value = "${aws_api_gateway_rest_api.test_api.execution_arn}/*/*"
}