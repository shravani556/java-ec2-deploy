output "master_ip" {
  value = aws_instance.master.public_ip
}

output "slave_ips" {
  value = [for instance in aws_instance.slave : instance.public_ip]
}