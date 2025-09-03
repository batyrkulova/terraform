resource "aws_route53_record" "app" {
  zone_id = "Z0490280173RVMU99RZMY"
  name    = "game.amsparkle.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_lb.main.dns_name]
  
}
resource "aws_lb_listener_certificate" "example_certificate_attachment" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = data.aws_acm_certificate.existing_certificate.arn
}



