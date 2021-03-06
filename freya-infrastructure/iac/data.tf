data "aws_iam_policy_document" "AWSLambdaTrustPolicy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

# ---------------------------
# AWS S3 Policies
# ---------------------------

data "aws_iam_policy_document" "AWSS3TrustPolicy" {
  statement {
    actions   = ["s3:ListObject"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::${aws_s3_bucket.freya_lambda_bucket.arn}"]
  }

  statement {
    actions   = ["s3:*Object"]
    effect    = "Allow"
    resources = ["arn:aws:s3:::${aws_s3_bucket.freya_lambda_bucket.arn}/*"]
  }
}

# ---------------------------
# AWS CloudWatch policies
# ---------------------------

data "aws_iam_policy_document" "AWSLambdaLoggingPolicy" {
  statement {
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
    effect    = "Allow"
    resources = ["arn:aws:logs:*:*:*"]
  }
}
