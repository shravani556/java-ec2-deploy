output "master_ip" {
  value = module.ec2-infra.master_ip
}

output "slave_ips" {
  value = module.ec2-infra.slave_ips
}