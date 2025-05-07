output "certificate_arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.cert.arn
}

output "certificate_validation_arn" {
  description = "ARN of the certificate validation"
  value       = aws_acm_certificate_validation.cert.certificate_arn
}

output "validation_record_name" {
  description = "The name of the validation record"
  value       = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_name
}

output "validation_record_value" {
  description = "The value of the validation record"
  value       = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_value
}

output "validation_record_type" {
  description = "The type of the validation record"
  value       = tolist(aws_acm_certificate.cert.domain_validation_options)[0].resource_record_type
}

output "validation_records" {
  description = "all of the certf validation options needed"
  value = [
    for dvo in aws_acm_certificate.cert.domain_validation_options : {
      name  = dvo.resource_record_name
      value = dvo.resource_record_value
      type  = dvo.resource_record_type
    }
  ]
} 