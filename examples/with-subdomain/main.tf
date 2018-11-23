module "email" {
  source = "gnarea/gmail/cloudflare"

  domain = "acme.com"
  subdomain = "subsidiary.acme.com"
}
