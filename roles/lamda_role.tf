resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name
  assume_role_policy = file("${path.module}/policies/lambda_role_assume_role_policy.json")
}