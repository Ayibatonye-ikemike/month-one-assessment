output "vpc_id" {
  value = aws_vpc.main.id
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
