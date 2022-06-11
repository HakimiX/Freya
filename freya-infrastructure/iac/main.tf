resource "aws_lambda_function" "freya_lambda" {
  function_name = "freya_lambda"
  filename      = "resources/placeholder.zip" # TODO: change this to s3 bucket
  role          = aws_iam_role.freya_lambda_role.arn
  runtime       = "java8"
  handler       = "freya-lambda.lambda.handler"
  memory_size   = "1536"
}
