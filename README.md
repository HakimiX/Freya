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

### Overview 

![](resources/freya-overview.png)

### Components
todo...

#### AWS Lambda
todo...

#### AWS CloudWatch
todo...

#### AWS EventBridge
todo...

#### AWS S3
todo...

### Infrastructure
#### Terraform

The AWS provider is used to interact with resources supported by AWS. The provider
is configured with the proper credentials before usage. The configuration for the AWS
provider is derived from Environment variables. 

Credentials are provided by using the `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY` environment variables.
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


### CI/CD
#### Jenkins
#### Deployment

### Local Development

#### Initial Dependencies
Install initial dependencies required for local development by running `scripts/install-dependencies.sh`
```shell
# If you're using MacOS
./install-dependencies.sh --mac

# If you're using Ubuntu
./install-dependencies.sh --ubuntu
```
