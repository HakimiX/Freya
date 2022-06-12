# Freya Infrastructure

* [Lambda](#lambda)
  * [Deploying Code](#deploying-code)

### Lambda
#### Deploying Code
The configuration inside the AWS Lambda details specifies `s3_bucket` and `s3_key`. These 
are the Lambda deploy bucket and s3 key object. 
```shell
resource "aws_lambda_function" "freya_lambda" {
  s3_bucket = "some-bucket"
  s3_key    = "some-key"
}
```
Terraform will instruct AWS to deploy the Lambda code from the s3 object. 
