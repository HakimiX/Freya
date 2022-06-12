resource "aws_lambda_function" "freya_lambda" {
  s3_bucket     = aws_s3_bucket.freya_lambda_bucket.id
  s3_key        = aws_s3_bucket_object.freya_lambda_bucket_object.key
  function_name = "freya_lambda"
  role          = aws_iam_role.freya_lambda_role.arn
  runtime       = "java8"
  handler       = "freya-lambda.lambda.handler"
  memory_size   = "1536"
  depends_on    = [aws_s3_bucket.freya_lambda_bucket]
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
  source     = "../../freya-lambda/target/uberjar/freya-lambda-0.1.0-SNAPSHOT-standalone.jar" # must be present
  depends_on = [aws_s3_bucket.freya_lambda_bucket]
}
