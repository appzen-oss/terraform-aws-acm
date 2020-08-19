variable "acm_cert_domain" {
  description = "Certificate domain name."
}

variable "dns_parent_zone_name" {
  description = "DNS name of the parent zone."
}

variable "environment" {
  description = "Environment (ex: `dev`, `qa`, `stage`, `prod`)."
}
