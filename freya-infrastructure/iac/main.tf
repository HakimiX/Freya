resource "aws_lambda_function" "freya_lambda" {
  s3_bucket     = aws_s3_bucket.freya_lambda_bucket.id
  s3_key        = aws_s3_bucket_object.freya_lambda_bucket_object.key
  function_name = "freya_lambda"
  role          = aws_iam_role.freya_lambda_role.arn
  runtime       = "java8"
  handler       = "freya-lambda.lambda.handler"
  memory_size   = "1536"
  depends_on    = [aws_s3_bucket.freya_lambda_bucket]

  environment {
    variables = {
      API_ENDPOINT = "https://jsonplaceholder.typicode.com/"
    }
  }
}

resource "aws_s3_bucket" "freya_lambda_bucket" {
  bucket = "freya-lambda-bucket"

  tags = {
    Name        = "Freya Lambda Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "freya_lambda_bucket_object" {
  bucket     = aws_s3_bucket.freya_lambda_bucket.id
  key        = "freya-lambda-0.1.0-SNAPSHOT-standalone.jar"
  source     = "../../freya-lambda/target/uberjar/freya-lambda-0.1.0-SNAPSHOT-standalone.jar"
  depends_on = [aws_s3_bucket.freya_lambda_bucket]
}

/*resource "aws_cloudwatch_log_group" "function_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.freya_lambda.function_name}"
  retention_in_days = 1
  lifecycle {
    prevent_destroy = false
  }
}*/

# --------------------------
# EventBridge (CloudWatch Events)
# --------------------------

resource "aws_cloudwatch_event_rule" "every_one_minute" {
  name                = "every-one-minute"
  description         = "fires every one minutes"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "fetch_data_every_one_minute" {
  arn       = aws_lambda_function.freya_lambda.arn
  rule      = aws_cloudwatch_event_rule.every_one_minute.name
  target_id = "lambda"
  input_transformer {
    input_template = "{\"type\":\"fetch-data\",\"source\":\"aws.events\"}"
  }
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.freya_lambda.function_name
  principal     = "events.amazonaws.com"
  statement_id  = "AllowExecutionFromCloudWatch"
  source_arn    = aws_cloudwatch_event_rule.every_one_minute.arn
}
