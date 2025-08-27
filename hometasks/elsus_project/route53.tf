resource "aws_route53_record" "www" {
  zone_id = "Z0490280173RVMU99RZMY"
  name    = "game.amsparkle.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main.dns_name]
}
