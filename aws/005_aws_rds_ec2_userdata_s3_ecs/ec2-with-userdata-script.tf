


resource "aws_instance" "testing_code_host" {
  # first amazon linux on the console:  ami-e251209a
  ami = "ami-e251209a"
  instance_type = "t1.micro"
  subnet_id = "${module.subnet_public_west_2a.created_subnet_id}"
  #vpc_security_group_ids = ["${aws_security_group.ssh_only_mybigfatcompany.id}", "${aws_security_group.ping_only_qa_vpc.id}"]
  vpc_security_group_ids = ["${aws_security_group.ssh_only_mybigfatcompany.id}", "${aws_security_group.ping_only_mybigfatcompany.id}", "${aws_security_group.ping_only_qa_vpc.id}", "${aws_security_group.ssh_only_vpn.id}"]
  availability_zone = "us-west-2a"
  key_name = "${aws_key_pair.key_bastion.key_name}"
  private_ip = "1.1.1.5"   #subnet: private: west: 2a: 32-63
  associate_public_ip_address = "true"

  tags {
  Name = "delete this"
  }

  #user_data = "apt-get update -y"
  #user_data = "file://home/ec2-user/foobar_script.sh"
  #user_data = "chmod 744 home/ec2-user/foobar_script.sh; sudo ./foobar_script.sh"
  #user_data = "chmod 744 /home/ec2-user/foobar_script.sh"


  user_data = <<HEREDOC
  #!/bin/bash
  yum update -y
  echo hello > /tmp/hello
HEREDOC


}


output "private_ip_of_codetesting_host" {
  value = ["${aws_instance.testing_code_host.private_ip}"]
}

output "public_ip_of_codetesting_host" {
  value = ["${aws_instance.testing_code_host.public_ip}"]
}

