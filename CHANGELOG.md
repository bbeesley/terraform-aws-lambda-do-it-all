# [1.10.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.9.0...1.10.0) (2020-09-21)


### Features

* **providers:** allow aws provider @ versions >3.0 ([34e7a1f](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/34e7a1f8cac9d49b70f0cdbf9004b54994ea1e8b))

# [1.9.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.8.1...1.9.0) (2020-09-17)


### Features

* **outputs:** expose all arn types ([049e614](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/049e6143097e365875aef9f09644ce8114a570a1))

## [1.8.1](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.8.0...1.8.1) (2020-09-04)


### Bug Fixes

* **iam:** add createLogStream permissions for lambdas ([5481955](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/5481955a82c6e5acf486b8098911e299257bd144))

# [1.8.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.7.1...1.8.0) (2020-09-03)


### Features

* **iam:** remove AWSLambdaVPCAccessExecutionRole ([eb0febb](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/eb0febbe2027aa32b8e87f91cdab523dc68f1b4a))

## [1.7.1](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.7.0...1.7.1) (2020-09-03)


### Bug Fixes

* define iam role dependency to help with fresh deployment edge case ([ec49359](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/ec4935916c2a57ed76ee07d46e31ae45bfc19312))

# [1.7.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.6.1...1.7.0) (2020-09-02)


### Features

* allow custom Lambda descriptions ([cb383de](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/cb383de07dcdb755cc53777b72efdd3448c9c289))

## [1.6.1](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.6.0...1.6.1) (2020-06-29)

# [1.6.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.5.0...1.6.0) (2020-06-22)


### Features

* **iam:** remove resource type from resource name in iam resources ([1619f8f](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/1619f8f2ee7504f733a4f3ec04c7fd7fafb5a341))

# [1.5.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.4.0...1.5.0) (2020-05-14)


### Features

* **layers:** add support for lambda layers ([0d79400](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/0d79400acf70cb2f88bc29aca1a7c5334fd3bf2d))

# [1.4.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.3.0...1.4.0) (2020-05-01)


### Features

* extend trust relationships with additional policies ([66191ea](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/66191ea2a50075edd1f41dcc8a767e60dd8bbd15))

# [1.3.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.2.0...1.3.0) (2020-03-25)


### Features

* add support for dlq target config ([38e6505](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/38e6505ceb01999715e8ed2b064bdd7687dc138b))

# [1.2.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.1.0...1.2.0) (2020-03-13)


### Features

* output lambda function name ([c828139](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/c828139ae56ad1e36b140b5a79ef3e714ea54f32))

# [1.1.0](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.0.3...1.1.0) (2020-03-13)


### Features

* output lambda role name ([7cce29e](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/7cce29e584702b695ba85af4a90e304e1dd19089))

## [1.0.3](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.0.2...1.0.3) (2020-03-13)


### Bug Fixes

* **tf:** ensure log group is created before lambda ([611b1a8](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/611b1a85629f6ea9a447ef00c89d9747e6241fd3))

## [1.0.2](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.0.1...1.0.2) (2020-02-12)

## [1.0.1](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/compare/1.0.0...1.0.1) (2020-02-12)


### Bug Fixes

* **ci:** correct the tag format to match terraform preferred style ([7173b7e](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/7173b7e083f0dd8215ac04584652829c4b56c64e))

# 1.0.0 (2020-02-12)


### Features

* add alias support and default vars ([aa17f3f](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/aa17f3f4e28a19a9dca9bf88de26df92f127bc6f))
* describe outputs & explicitly define sets ([f263d0a](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/f263d0aa316bd81ef9c59b280f8a949a8327d8c1))
* initial version for testing ([c7754e2](https://github.com/bbeesley/terraform-aws-lambda-do-it-all/commit/c7754e2473fb40f51d3f031f280d652f7af52f2e))
