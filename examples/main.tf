terraform {
  required_version = "~> 0.12.1"
}

provider "aws" {
  region = "eu-west-1"
}

module "cert" {
  source = "../"

  namespace   = "arghul"
  environment = "dev"
  name        = "test.dev.arghul.com"
}

output "arn" {
  value = module.cert.arn
}

