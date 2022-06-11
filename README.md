# Freya 

An event-driven application that consists of AWS EventBridge, AWS Lambda, AWS CloudWatch, and AWS S3. 

**Technologies**: Clojure, Terraform, Jenkins, and AWS. <br> 
**Versions**: Leiningen 2.9.8, Java 1.8.0 _(Coretto 8)_, Terraform v1.2.2, Jenkins JVM on Java 11 _(jdk11)_

* [Overview](#overview)
* [Components](#components)
  * [AWS Lambda](#aws-lambda)
  * [AWS CloudWatch](#aws-cloudwatch)
  * [AWS EventBridge](#aws-eventbridge)
  * [AWS S3](#aws-s3)
* [Infrastructure](#infrastructure)
  * [Terraform](#terraform)
* [CI/CD](#cicd)
  * [Jenkins](#jenkins)
  * [Deployment](#deployment)
* [Local Development](#local-development)
  * [Initial Dependencies](#initial-dependencies)
* [Sources](#sources)

## Overview 

![](resources/freya-overview.png)

## Components
todo...

### AWS Lambda
todo...

### AWS CloudWatch
todo...

### AWS EventBridge
todo...

### AWS S3
todo...

## Infrastructure
todo... (iac)

### Terraform

The AWS provider is used to interact with resources supported by AWS. The provider
is configured with the proper credentials before usage. The configuration for the AWS
provider is derived from Environment variables or using Shared Configuration and Credentials Files

#### AWS Credentials
**Shared Configuration and Credentials Files**<br>
The AWS CLI stores sensitive credential information that you specify with `aws configure` in a local
file named `credentials`, in a folder named `.aws` in the home directory.

`~/.aws/credentials`
```shell
[default]
aws_access_key_id = <some-access-key>
aws_secret_access_key = <some-secret-access-key>
```
`~/.aws/config`
```shell
[default]
region = us-west-2
output = json
```

The Terraform AWS provider can source credentials from the `~/.aws` directory. If no named profile
is specified, the `default` profile is used. 
```terraform
provider "aws" {
  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "customprofile" # only if you custom aws profile is used
}
```

**Environment Variables**<br>
Credentials can also be provided by using the `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY` environment variables.
For example:
```terraform
provider "aws" {
  region = "eu-west-1"
}
```
```shell
$ export AWS_ACCESS_KEY_ID="some-access-key"
$ export AWS_SECRET_ACCESS_KEY="some-secret-access-key"
```

#### Applying Infrastructure locally

```shell
# Initialize a working directory containing Terraform configuration files
terraform init

# Validate the configuration files
terraform validate 

# Preview the changes that Terraform plans to make
terraform plan
```

## CI/CD
### Jenkins
### Deployment

## Local Development

### Initial Dependencies
Install initial dependencies required for local development by running `scripts/install-dependencies.sh`
```shell
# If you're using MacOS
./install-dependencies.sh --mac

# If you're using Ubuntu
./install-dependencies.sh --ubuntu
```

### Sources

* [AWS Configuration and Credential Files](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
* [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
