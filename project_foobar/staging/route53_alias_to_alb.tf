


# ______________________________________________________________________________________
resource "aws_route53_zone" "foobarapp_dash_qa" {
  name = "foobarapp-qa.mybigfatcompany.com"
  tags {
    name_node_id  = "need_to_add_this"
    environment   = "qa"
    project       = "t"
    product_name  = "foobar"
    business_unit = "need_to_add_this"
  }
}


output "name_servers" {  
  value = "${aws_route53_zone.foobarapp_dash_qa.name_servers}"
}


# A record for QA subdomain
resource "aws_route53_record" "foobarappqa_a_record" {
  zone_id = "${aws_route53_zone.foobarapp_dash_qa.zone_id}"
  name = "foobarapp-qa.mybigfatcompany.com"
  #name    = "www.example.com"
  type    = "A"
  #ttl     = "300"
  #records = ["${aws_eip.lb.public_ip}"]
  #records = ["1.1.1.1"]
  alias {
    #name = "${module.ambassadors_webapp_prod.aws_alb.dns_name}"
    name = "${aws_lb.foobarapp_qa_alb.dns_name}"
    #zone_id = "${module.ambassadors_webapp_prod.aws_alb.zone_id}"
    zone_id = "${aws_lb.foobarapp_qa_alb.zone_id}"
    evaluate_target_health = true
  }
}
