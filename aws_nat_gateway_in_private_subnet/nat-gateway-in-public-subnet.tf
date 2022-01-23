
# NAT GW 

resource "aws_nat_gateway" "natgw_qa_west_public_2a" {
    allocation_id = "${aws_eip.eip_for_natgw_qa.id}"
    subnet_id = "${module.subnet_public_west_2a.created_subnet_id}"
    depends_on = ["aws_internet_gateway.igw_qa_vpc"]

    #lifecycle {
       #create_before_destroy = true
    #}
 
    tags {
      Name = "nat_gateway_qa_west_public_2a"
    }
}

output "nat_gateway_public_2a_id" { value = ["${aws_nat_gateway.natgw_qa_west_public_2a.id}"] }
output "nat_gateway_public_2a_private_ip" { value = ["${aws_nat_gateway.natgw_qa_west_public_2a.private_ip}"] }
output "nat_gateway_public_2a_public_ip" { value = ["${aws_nat_gateway.natgw_qa_west_public_2a.public_ip}"] }
