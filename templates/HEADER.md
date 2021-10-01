[![build and test](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/actions/workflows/build-and-test.yml)

# terraform-aws-lambda-do-it-all

Terraform module to provision a lambda with full permissions

## Introduction

The module provisions the following resources:

* aws_cloudwatch_log_group
* aws_iam_policy
* aws_iam_role
* aws_iam_role_policy_attachment
* aws_lambda_alias
* aws_lambda_function

## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/bbeesley/terraform-module-lambda-do-it-all/releases).


```hcl
provider "aws" {
  region = var.region
}

module "a_lambda_function" {
  source = "../terraform-module-lambda-do-it-all"

  name           = "a-little-function"
  aws_region     = "eu-central-1"
  aws_profile    = "55555555555"
  tags           = {
    URL = "http://example.com"
  }
  handler        = "packages/a-little-function/dist/handler.go"
  lambda_runtime = "nodejs12.x"
  timeout        = 60
  s3_bucket      = "55555555555-lambda-artefacts"
  s3_key         = "a-little-function-1.3.2"
  environment_vars = {
    ENVIRONMENT = "staging"
  }
  policies = [
    {
      Action = [
        "dynamodb:DescribeTable",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ]
      Resource = [
        "my-little-table",
        "my-little-table/*"
      ]
      Effect = "Allow"
    }
  ]
}
```

