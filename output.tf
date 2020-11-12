output "wordpress_host" {
  value = "http://${aws_instance.webserver.public_dns}"
}
output "ssh_access" {
  value = "ubuntu@${aws_instance.webserver.public_ip}"
}
