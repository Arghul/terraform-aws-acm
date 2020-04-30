# Terraform AWS ACM

Terraform module to create AWS ACM certificates


## Prerequisites
This module has a few dependencies:
* Terraform 0.12

## Examples
To create a certificate for *test.dev.arghul.com*
```hcl-terraform
module "cert" {
  source = "git::https://github.com/arghul/terraform-aws-acm.git?ref=master"

  namespace   = "arghul"
  environment = "dev"
  name        = "test.dev.arghul.com"
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes | `list(string)` | `[]` | no |
| delimiter | Label delimiter | `string` | `"-"` | no |
| dns\_private\_zone | Whether zone is private or public. Default false (public) | `bool` | `false` | no |
| dns\_zone\_name | DNS zone name. Default to figure it out from name | `string` | `""` | no |
| enable | Whether to enable or disable module | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| name | Service name | `string` | n/a | yes |
| namespace | Service namespace (eg: api, web, ops) | `string` | `""` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Service tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
