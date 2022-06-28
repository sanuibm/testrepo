variable "api_name" {
  type = string
  description = "name of the rest api"
  default = "test-api"
}

variable "policy" {
  type = string
  default = null
}

variable "lambda_arn" {
  type = string
  description = "arn of the lambda resource to be triggered"
  default = ""
}