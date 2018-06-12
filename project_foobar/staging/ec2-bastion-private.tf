
# creates the bastion host. This one can't use the ec2-modulke because
# module cannot enforce a fixed IP.


resource "aws_instance" "bastion_host" {
  # first amazon linux on the console:  ami-e251209a
  ami = "ami-e251209a"
  instance_type = "t1.micro"
  subnet_id = "${module.subnet_private_west_2a.created_subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.ssh_only_mybigfatcompany.id}", "${aws_security_group.ping_only_mybigfatcompany.id}", "${aws_security_group.ping_only_qa_vpc.id}"]
  #vpc_security_group_ids = ["${aws_security_group.ssh_only_mybigfatcompany.id}", "${aws_security_group.ping_only_qa_vpc.id}"]
  availability_zone = "us-west-2a"
  key_name = "${aws_key_pair.key_bastion.key_name}"
  private_ip = "10.1.2.4"   #subnet: private: west: 2a: 32-63

  tags {
  Name = "Bastion Host QA"
  }
}


output "private_ip_bastion_host" {
  value = ["${aws_instance.bastion_host.private_ip}"]
}

