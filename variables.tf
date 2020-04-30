variable "enable" {
  description = "Whether to enable or disable module"
  type        = bool
  default     = true
}

variable "name" {
  description = "Service name"
  type        = string
}

variable "namespace" {
  description = "Service namespace (eg: api, web, ops)"
  default     = ""
}

variable "stage" {
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
  type        = string
  default     = ""
}

variable "attributes" {
  description = "Additional attributes"
  type        = list(string)
  default     = []
}

variable "delimiter" {
  description = "Label delimiter"
  type        = string
  default     = "-"
}

variable "tags" {
  description = "Service tags"
  type        = map(string)
  default     = {}
}

variable "dns_private_zone" {
  description = "Whether zone is private or public. Default false (public)"
  type        = bool
  default     = false
}

variable "dns_zone_name" {
  description = "DNS zone name. Default to figure it out from name"
  type        = string
  default     = ""
}

