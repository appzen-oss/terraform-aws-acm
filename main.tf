resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.acm_cert_domain}"
  validation_method = "DNS"

  tags = {
    Environment = "${var.environment}"
  }
}

data "aws_route53_zone" "route53" {
  name = "${var.dns_parent_zone_name}."
}

resource "aws_route53_record" "validation_record" {
  depends_on = ["aws_acm_certificate.cert"]
  count      = "${length(aws_acm_certificate.cert.domain_validation_options)}"
  name       = "${lookup(aws_acm_certificate.cert.domain_validation_options[count.index], "resource_record_name")}"
  type       = "${lookup(aws_acm_certificate.cert.domain_validation_options[count.index], "resource_record_type")}"
  records    = ["${lookup(aws_acm_certificate.cert.domain_validation_options[count.index], "resource_record_value")}"]
  zone_id    = "${data.aws_route53_zone.route53.zone_id}"
  ttl        = 60
}
