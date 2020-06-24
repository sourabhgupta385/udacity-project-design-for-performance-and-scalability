variable "aws_region" {
  type        = string
  description = "The region where the lambda function will be deployed."
  default     = "us-east-1"
}

variable "lambda_function_name" {
  type        = string
  description = "The name of the lambda function."
  default     = "greet_lambda"
}