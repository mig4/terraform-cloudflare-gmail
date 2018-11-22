variable "domain" {
  description = "The APEX domain (e.g., example.com)"
}

variable "sub_domain" {
  description = "The sub-domain for the MX records, if applicable"
  default = "@"
}

variable "ttl" {
  description = "TTL for the DNS records"
  default = 3600
}
