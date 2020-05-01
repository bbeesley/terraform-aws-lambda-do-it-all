<!--
Dynamically generated file
Do not modify
To edit the contents of this file, modify the header and footer in the templates directory
-->
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

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| additional\_assume\_role\_policies | List of objects defining additional non-Lambda IAM trust relationship statements | <pre>list(object({<br>    Action = list(string)<br>    Principal = object({<br>      Service = string<br>    })<br>    Effect = string<br>  }))</pre> | `[]` | no |
| alias | Lambda alias name | `string` | n/a | yes |
| aws\_profile | The account profile to deploy the lamnda function within | `string` | n/a | yes |
| aws\_region | The region in which to deploy the lambda function | `string` | n/a | yes |
| dead\_letter\_target | Target ARN for an SQS queue or SNS topic to notify on failed invocations | `string` | n/a | yes |
| dead\_letter\_target\_type | The type of the dlq target, must be 'SNS' or 'SQS' | `string` | n/a | yes |
| environment\_vars | n/a | `map(string)` | `{}` | no |
| handler | Path to the lambda handler | `string` | n/a | yes |
| lambda\_concurrency | Limit concurrent executions of the lambda fn | `number` | n/a | yes |
| lambda\_runtime | Runtime to invoke the lambda with | `string` | n/a | yes |
| log\_retention | Time in days to retain logs for | `number` | `3` | no |
| memory\_size | Memory allocation for the lambda function | `number` | `1024` | no |
| name | The name to give to the lambda function | `string` | n/a | yes |
| policies | List of objects defining IAM policy statements | <pre>list(object({<br>    Action   = list(string)<br>    Resource = list(string)<br>    Effect   = string<br>  }))</pre> | `[]` | no |
| publish | Should this be published as a version | `bool` | `false` | no |
| s3\_bucket | The S3 bucket your lambda artifact is stored in | `string` | n/a | yes |
| s3\_key | The name of the lambda artifact in the bucket | `string` | n/a | yes |
| tags | Tags to attach to all resources | `map(string)` | n/a | yes |
| timeout | Function timeout, execution gets cancelled after this many seconds | `number` | `60` | no |
| tracing\_config\_mode | X Ray tracing mode to use | `string` | n/a | yes |
| vpc\_security\_groups | VPC security groups to apply to the lambda | `list(string)` | n/a | yes |
| vpc\_subnets | VPC subnets to run the lambda in | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| alias | Name of the lambda function alias |
| arn | ARN for the lambda function |
| name | The lambda function name |
| role | Name of the lambda role |
| version | Current version of the lambda function |


## License 

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Source: <https://opensource.org/licenses/MIT>

