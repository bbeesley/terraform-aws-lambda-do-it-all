variable "name" {
  description = "The name to give to the lambda function"
  type        = string
}

variable "aws_region" {
  description = "The region in which to deploy the lambda function"
  type        = string
}

variable "aws_profile" {
  description = "The account profile to deploy the lamnda function within"
  type        = string
}

variable "log_retention" {
  description = "Time in days to retain logs for"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Tags to attach to all resources"
  type        = map(string)
}

variable "handler" {
  description = "Path to the lambda handler"
  type        = string
}

variable "memory_size" {
  description = "Memory allocation for the lambda function"
  type        = number
  default     = 1024
}

variable "lambda_runtime" {
  description = "Runtime to invoke the lambda with"
  type        = string
}

variable "timeout" {
  description = "Function timeout, execution gets cancelled after this many seconds"
  type        = number
  default     = 60
}

variable "lambda_concurrency" {
  description = "Limit concurrent executions of the lambda fn"
  type        = number
  default     = null
}

variable "s3_bucket" {
  description = "The S3 bucket your lambda artifact is stored in"
  type        = string
}

variable "s3_key" {
  description = "The name of the lambda artifact in the bucket"
  type        = string
}

variable "tracing_config_mode" {
  description = "X Ray tracing mode to use"
  default     = null
  type        = string
}

variable "environment_vars" {
  type    = map(string)
  default = {}
}

variable "vpc_subnets" {
  description = "VPC subnets to run the lambda in"
  type        = list(string)
  default     = null
}

variable "vpc_security_groups" {
  description = "VPC security groups to apply to the lambda"
  type        = list(string)
  default     = null
}

variable "additional_assume_role_policies" {
  description = "List of objects defining additional non-Lambda IAM trust relationship statements"
  type = list(object({
    Action = list(string)
    Principal = object({
      Service = string
    })
    Effect = string
  }))
  default = []
}


variable "policies" {
  description = "List of objects defining IAM policy statements"
  type = list(object({
    Action   = list(string)
    Resource = list(string)
    Effect   = string
  }))
  default = []
}

variable "publish" {
  description = "Should this be published as a version"
  type        = bool
  default     = false
}


variable "alias" {
  description = "Lambda alias name"
  type        = string
  default     = null
}

variable "dead_letter_target" {
  description = "Target ARN for an SQS queue or SNS topic to notify on failed invocations"
  type        = string
  default     = null
}

variable "dead_letter_target_type" {
  description = "The type of the dlq target, must be 'SNS' or 'SQS'"
  type        = string
  default     = null
}
