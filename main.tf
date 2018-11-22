locals {
  mx_server_domains = [
    "aspmx.l.google.com",
    "alt1.aspmx.l.google.com",
    "alt2.aspmx.l.google.com",
    "alt3.aspmx.l.google.com",
    "alt4.aspmx.l.google.com",
  ]
}

resource "cloudflare_record" "mx" {
  count = "${length(local.mx_server_domains)}"

  domain = "${var.domain}"
  name = "${var.sub_domain}"
  value = "${local.mx_server_domains[count.index]}"
  priority = "${count.index + 1}"
  type = "MX"
  ttl = "${var.ttl}"
}

resource "cloudflare_record" "spf" {
  domain = "${var.domain}"
  name = "${var.sub_domain}"
  type = "TXT"
  value = "v=spf1 include:_spf.google.com ~all"
}
