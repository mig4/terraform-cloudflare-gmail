# terraform-cloudflare-gmail

_terraform-cloudflare-gmail_ manages MX and SPF records for Gmail on your CloudFlare-hosted domain.

For example, the following configuration will generate the appropriate DNS records for the domain `example.com`:

```hcl
module "email" {
  source = "gnarea/gmail/cloudflare"

  domain = "example.com"
}
```

## Migrating from terraform-gmail

Migrating from [terraform-gmail](https://github.com/gnarea/terraform-gmail) is easy:

1. Change your module's source to `"gnarea/gmail/cloudflare"`, as in the example above.
1. Rename the resources for the MX records (assuming you named your module `email`):
   ```
   terraform state mv module.email.cloudflare_record.main[0] module.email.cloudflare_record.mx[0]
   terraform state mv module.email.cloudflare_record.main[1] module.email.cloudflare_record.mx[1]
   terraform state mv module.email.cloudflare_record.main[2] module.email.cloudflare_record.mx[2]
   terraform state mv module.email.cloudflare_record.main[3] module.email.cloudflare_record.mx[3]
   terraform state mv module.email.cloudflare_record.main[4] module.email.cloudflare_record.mx[4]
   ```
1. Finally, `terraform apply` to create the SPF record. Nothing else must change.
