locals {
  name         = module.label.name
  name_as_list = split(".", local.name)

  dns_zone_name = var.dns_zone_name != "" ? var.dns_zone_name : join(".", slice(local.name_as_list, 1, length(local.name_as_list)))
}

module "label" {
  source              = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  namespace           = var.namespace
  stage               = var.stage
  environment         = var.environment
  name                = var.name
  attributes          = var.attributes
  delimiter           = var.delimiter
  tags                = var.tags
  regex_replace_chars = "/[^a-zA-Z0-9-.]/"
}


data "aws_route53_zone" "zone" {
  count        = var.enable ? 1 : 0
  name         = local.dns_zone_name
  private_zone = var.dns_private_zone
}

resource "aws_route53_record" "cert_validation" {
  count   = var.enable ? 1 : 0
  name    = aws_acm_certificate.cert[0].domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.cert[0].domain_validation_options.0.resource_record_type
  zone_id = data.aws_route53_zone.zone[0].zone_id
  records = [aws_acm_certificate.cert[0].domain_validation_options.0.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert" {
  count                   = var.enable ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert[0].arn
  validation_record_fqdns = aws_route53_record.cert_validation.*.fqdn

}

resource "aws_acm_certificate" "cert" {
  count             = var.enable ? 1 : 0
  domain_name       = local.name
  validation_method = "DNS"

  tags = merge(module.label.tags, {
    Name = local.name
  })

  lifecycle {
    create_before_destroy = true
  }
}
