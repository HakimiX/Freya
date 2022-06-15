resource "aws_iam_role" "freya_lambda_role" {
  name               = "freya_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.AWSLambdaTrustPolicy.json
}

resource "aws_iam_role_policy_attachment" "freya_lambda_policy" {
  role       = aws_iam_role.freya_lambda_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_policy" "freya_bucket_policy" {
  name   = "freya-bucket-policy"
  policy = data.aws_iam_policy_document.AWSS3TrustPolicy.json
}

resource "aws_iam_role_policy_attachment" "freya_lambda_bucket_policy" {
  role       = aws_iam_role.freya_lambda_role.id
  policy_arn = aws_iam_policy.freya_bucket_policy.arn
}

# --------------------------
# Lambda Logging
# --------------------------

# Lambda logging policy
resource "aws_iam_policy" "freya_lambda_logging_policy" {
  name   = "freya-lambda-logging-policy"
  policy = data.aws_iam_policy_document.AWSLambdaLoggingPolicy.json
}

# Attach the logging policy to the Lambda
resource "aws_iam_role_policy_attachment" "freya_lambda_logging_policy_attachment" {
  policy_arn = aws_iam_policy.freya_lambda_logging_policy.arn
  role       = aws_iam_role.freya_lambda_role.id
}
