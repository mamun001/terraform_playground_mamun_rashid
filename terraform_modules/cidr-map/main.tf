


variable "cidr_map" {
  type = "map"
default = {
    office   = "10.1.1.5/32" #example
    vpnip      = "10.2.2.6/32" #example
  }
}

output "cidr_office" { value = "${var.cidr_map["office"]}" }
output "cidr_vpnip" { value = "${var.cidr_map["vpnip"]}" }


