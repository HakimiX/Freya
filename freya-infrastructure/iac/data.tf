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
