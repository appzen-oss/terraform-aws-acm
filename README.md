# terraform-aws-acm

A terraform module to create and maintain SSL certs through AWS ACM. 

## Assumption

* You want to create a certificate through ACM
* You want to create DNS entries for certificate validation.
* You've creaated AWS R53 parent zone.

## Required
- `dns_parent_zone_name` - AWS parent zone 
- `acm_cert_domain` - SSL certificate domain name
- `environment` - Environment (ex: dev, qa, stage, prod).
## Usage 
```hcl
module "acm_cert" {
	source = "../../terraform-aws-acm"
	dns_parent_zone_name = "${var.dns_parent_zone_name}"
	acm_cert_domain      = "${var.acm_cert_domain}"
	environment          = "${var.environment}"
}
```
## Inputs
| Name | Description | Type  | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm\_cert\_domain | Domain name of ACM-managed certificate | string |  yes |
| dns_parent_zone_name | DNS name of the parent zone | string |  yes |
| environment | Environment (ex: `dev`, `qa`, `stage`, `prod`).|string| yes|

## Outputs
|Name| Description|
|----|------------|
|certificate\_arn| Arn of the ACM certificate|