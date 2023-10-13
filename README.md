# terraform-docs

[![Build Status](https://github.com/terraform-docs/terraform-docs/workflows/ci/badge.svg)](https://github.com/terraform-docs/terraform-docs/actions) [![GoDoc](https://pkg.go.dev/badge/github.com/terraform-docs/terraform-docs)](https://pkg.go.dev/github.com/terraform-docs/terraform-docs) [![Go Report Card](https://goreportcard.com/badge/github.com/terraform-docs/terraform-docs)](https://goreportcard.com/report/github.com/terraform-docs/terraform-docs) [![Codecov Report](https://codecov.io/gh/terraform-docs/terraform-docs/branch/master/graph/badge.svg)](https://codecov.io/gh/terraform-docs/terraform-docs) [![License](https://img.shields.io/github/license/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/blob/master/LICENSE) [![Latest release](https://img.shields.io/github/v/release/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/releases)

![terraform-docs-teaser](./images/terraform-docs-teaser.png)

Sponsored by [Scalr - Terraform Automation & Collaboration Software](https://scalr.com/?utm_source=terraform-docs)

<a href="https://www.scalr.com/?utm_source=terraform-docs" target="_blank"><img src="https://bit.ly/2T7Qm3U" alt="Scalr - Terraform Automation & Collaboration Software" width="175" height="40" /></a>

## What is terraform-docs

A utility to generate documentation from Terraform modules in various output formats.

## Documentation

- **Users**
  - Read the [User Guide] to learn how to use terraform-docs
  - Read the [Formats Guide] to learn about different output formats of terraform-docs
  - Refer to [Config File Reference] for all the available configuration options
- **Developers**
  - Read [Contributing Guide] before submitting a pull request

Visit [our website] for all documentation.

## Installation

The latest version can be installed using `go get`:

```bash
GO111MODULE="on" go get github.com/terraform-docs/terraform-docs@v0.15.0
```

**NOTE:** to download any version **before** `v0.9.1` (inclusive) you need to use to
old module namespace (`segmentio`):

```bash
# only for v0.9.1 and before
GO111MODULE="on" go get github.com/segmentio/terraform-docs@v0.9.1
```

**NOTE:** please use the latest Go to do this, minimum `go1.16` or greater.

This will put `terraform-docs` in `$(go env GOPATH)/bin`. If you encounter the error
`terraform-docs: command not found` after installation then you may need to either add
that directory to your `$PATH` as shown [here] or do a manual installation by cloning
the repo and run `make build` from the repository which will put `terraform-docs` in:

```bash
$(go env GOPATH)/src/github.com/terraform-docs/terraform-docs/bin/$(uname | tr '[:upper:]' '[:lower:]')-amd64/terraform-docs
```

Stable binaries are also available on the [releases] page. To install, download the
binary for your platform from "Assets" and place this into your `$PATH`:

```bash
curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.15.0/terraform-docs-v0.15.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs /some-dir-in-your-PATH/terraform-docs
```

**NOTE:** Windows releases are in `ZIP` format.

If you are a Mac OS X user, you can use [Homebrew]:

```bash
brew install terraform-docs
```

or

```bash
brew install terraform-docs/tap/terraform-docs
```

Windows users can install using [Scoop]:

```bash
scoop bucket add terraform-docs https://github.com/terraform-docs/scoop-bucket
scoop install terraform-docs
```

or [Chocolatey]:

```bash
choco install terraform-docs
```

Alternatively you also can run `terraform-docs` as a container:

```bash
docker run quay.io/terraform-docs/terraform-docs:0.15.0
```

**NOTE:** Docker tag `latest` refers to _latest_ stable released version and `edge`
refers to HEAD of `master` at any given point in time.

## Community

- Discuss terraform-docs on [Slack]

## License

MIT License - Copyright (c) 2021 The terraform-docs Authors.

[User Guide]: ./docs/user-guide/introduction.md
[Formats Guide]: ./docs/reference/terraform-docs.md
[Config File Reference]: ./docs/user-guide/configuration.md
[Contributing Guide]: CONTRIBUTING.md
[our website]: https://terraform-docs.io/
[here]: https://golang.org/doc/code.html#GOPATH
[releases]: https://github.com/terraform-docs/terraform-docs/releases
[Homebrew]: https://brew.sh
[Scoop]: https://scoop.sh/
[Chocolatey]: https://www.chocolatey.org
[Slack]: https://slack.terraform-docs.io/

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.21.0 |

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