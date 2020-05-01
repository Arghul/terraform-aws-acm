output "arn" {
  value = var.enable ? aws_acm_certificate.cert[0].arn : ""
}

