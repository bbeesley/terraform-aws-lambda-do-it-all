[![build and test](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/actions/workflows/build-and-test.yml)

# terraform-aws-lambda-do-it-all

Terraform module to provision a lambda with full permissions. All the resources you need to have a running lambda including cloudwatch logging are created for you. The module does support using a VPC, but in that case you'll need to create your own security groups.

## Usage

```hcl
provider "aws" {
  region = var.region
}

module "a_lambda_function" {
  source  = "bbeesley/lambda-do-it-all/aws"
  version = "~> 4.0"

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

## Usage with a vpc

```hcl
data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc-name"]
  }

  filter {
    name   = "owner-id"
    values = [var.aws_profile]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
  tags = {
    Tier = "Private"
  }
}

resource "aws_security_group" "this" {
  name   = "my-lambda"
  vpc_id = data.aws_vpc.this.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  security_group_id = aws_security_group.this.id
  from_port         = 0
  to_port           = 65535
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "access lambda to everything"
}

module "my_lambda" {
  source  = "bbeesley/lambda-do-it-all/aws"
  version = "~> 4.0"

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
  vpc_subnets         = data.aws_subnets.private.ids
  vpc_security_groups = [aws_security_group.this.id]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_insights_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_alias.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_alias) | resource |
| [aws_lambda_alias.alias_instant](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_alias) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_assume_role_policies"></a> [additional\_assume\_role\_policies](#input\_additional\_assume\_role\_policies) | List of objects defining additional non-Lambda IAM trust relationship statements | <pre>list(object({<br>    Action = list(string)<br>    Principal = object({<br>      Service = string<br>    })<br>    Effect = string<br>  }))</pre> | `[]` | no |
| <a name="input_alias"></a> [alias](#input\_alias) | Lambda alias name | `string` | `null` | no |
| <a name="input_architecture"></a> [architecture](#input\_architecture) | The CPU architecture to use | `string` | `"x86_64"` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The account profile to deploy the lamnda function within | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The region in which to deploy the lambda function | `string` | n/a | yes |
| <a name="input_custom_role_name"></a> [custom\_role\_name](#input\_custom\_role\_name) | Override for the default lambda role name | `string` | `""` | no |
| <a name="input_dead_letter_target"></a> [dead\_letter\_target](#input\_dead\_letter\_target) | Target ARN for an SQS queue or SNS topic to notify on failed invocations | `string` | `null` | no |
| <a name="input_dead_letter_target_type"></a> [dead\_letter\_target\_type](#input\_dead\_letter\_target\_type) | The type of the dlq target, must be 'SNS' or 'SQS' | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of what the Lambda Function does | `string` | `null` | no |
| <a name="input_efs_configuration"></a> [efs\_configuration](#input\_efs\_configuration) | Configuration for mounting an EFS file system | <pre>object({<br>    mount_point      = string<br>    access_point_arn = string<br>  })</pre> | `null` | no |
| <a name="input_environment_vars"></a> [environment\_vars](#input\_environment\_vars) | n/a | `map(string)` | `{}` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | Path to the lambda handler | `string` | n/a | yes |
| <a name="input_insights_enabled"></a> [insights\_enabled](#input\_insights\_enabled) | Turn on Lambda insights for the Lambda (limited regions only) | `bool` | `false` | no |
| <a name="input_instant_alias_update"></a> [instant\_alias\_update](#input\_instant\_alias\_update) | Whether to immediately point the alias at the latest version | `bool` | `false` | no |
| <a name="input_lambda_concurrency"></a> [lambda\_concurrency](#input\_lambda\_concurrency) | Limit concurrent executions of the lambda fn | `number` | `null` | no |
| <a name="input_lambda_runtime"></a> [lambda\_runtime](#input\_lambda\_runtime) | Runtime to invoke the lambda with | `string` | n/a | yes |
| <a name="input_layers"></a> [layers](#input\_layers) | List of lambda layer ARNs to attach | `list(string)` | `[]` | no |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | Time in days to retain logs for | `number` | `3` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Memory allocation for the lambda function | `number` | `1024` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to give to the lambda function | `string` | n/a | yes |
| <a name="input_policies"></a> [policies](#input\_policies) | List of objects defining IAM policy statements | <pre>list(object({<br>    Action   = list(string)<br>    Resource = list(string)<br>    Effect   = string<br>  }))</pre> | `[]` | no |
| <a name="input_publish"></a> [publish](#input\_publish) | Should this be published as a version | `bool` | `false` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | The S3 bucket your lambda artifact is stored in | `string` | n/a | yes |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | The name of the lambda artifact in the bucket | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to attach to all resources | `map(string)` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Function timeout, execution gets cancelled after this many seconds | `number` | `60` | no |
| <a name="input_tracing_config_mode"></a> [tracing\_config\_mode](#input\_tracing\_config\_mode) | X Ray tracing mode to use | `string` | `null` | no |
| <a name="input_vpc_security_groups"></a> [vpc\_security\_groups](#input\_vpc\_security\_groups) | VPC security groups to apply to the lambda | `list(string)` | `null` | no |
| <a name="input_vpc_subnets"></a> [vpc\_subnets](#input\_vpc\_subnets) | VPC subnets to run the lambda in | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias"></a> [alias](#output\_alias) | Name of the lambda function alias |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN for the lambda function |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws\_api\_gateway\_integration's uri |
| <a name="output_name"></a> [name](#output\_name) | The lambda function name |
| <a name="output_qualified_arn"></a> [qualified\_arn](#output\_qualified\_arn) | The ARN identifying your Lambda Function Version |
| <a name="output_role"></a> [role](#output\_role) | Name of the lambda role |
| <a name="output_version"></a> [version](#output\_version) | Current version of the lambda function |
<!-- END_TF_DOCS -->

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

