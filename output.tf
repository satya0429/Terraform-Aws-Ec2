# Instance ID's
output "instance_id" {
  description = "ID of the web-server instance"
  value       = aws_instance.t3640-web-server.id
}

# Availability Zones
output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.t3640-web-server.availability_zone
}

# Key Pair
output "key_name" {
  description = "List of key names of instances"
  value       = aws_instance.t3640-web-server.key_name
}

#output "instance_id_web1" {
#  description = "ID of the proxy-server instance"
#  value       = aws_instance.t13662-ws1.id
#}


#output "instance_id_web2" {
#  description = "ID of the proxy-server instance"
#  value       = aws_instance.t13662-ws2.id
#}

# Instance IP's 
output "instance_public_ip" {
  description = "Public IP address of the Web-1 instance"
  value       = aws_instance.t3640-web-server.public_ip
}

#output "instance_private_ip_web1" {
#  description = "Public IP address of the web-2 instance"
#  value       = aws_instance.t13662-ws2.private_ip
#}

#output "instance_private_ip_web2" {
#  description = "Public IP address of the proxy-server instance"
#  value       = aws_instance.t13662-proxy-server.public_ip
#}