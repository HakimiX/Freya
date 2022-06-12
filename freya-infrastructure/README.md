# Freya Infrastructure

* [Lambda](#lambda)
  * [Automatically Deploying Code](#automatically-deploying-code)
  * [Manually Deploying Code](#manually-deploying-code)

### Lambda
#### Automatically Deploying Code
The configuration inside the AWS Lambda details specifies `s3_bucket` and `s3_key`. These 
are the Lambda deploy bucket and s3 key object. 
```shell
resource "aws_lambda_function" "freya_lambda" {
  s3_bucket = "some-bucket"
  s3_key    = "some-key"
}
```
Terraform will instruct AWS to deploy the Lambda code from the s3 object. 

#### Manually Deploying Code
You can deploy code manually using the AWS CLI or through the AWS Console. 
Simply navigate to the Lambda function → Code → Code source → Upload From 

![](../resources/manually-upload-lambda-code.png)
