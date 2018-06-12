
variable "efs_mount_point" {
  type    = "string"
  default = "foobar_just_to_ensure_real_value_gets_sent"
}
#  various codes to help write the exact right  code
#  default = "fs-b5e3821c.efs.us-west-2.amazonaws.com"     # this one worked, needed interpolatiin in the .tpl file
#  default = "fs-b5e3821c.efs.us-west-2.amazonaws.com:/"   # this one worked as is


variable "efs_mount_point_2" {
  type    = "string"
  default = "foobar_just_to_ensure_real_value_gets_sent_2"
}



data "template_file" "user_data" {
  #template = "${file("${path.module}/userdata.tpl")}"
  #template = "${file("./templates/userdata_mount_efs.tpl")}"
  template = "${file("./templates/userdata_mount_2_efs.tpl")}"

  vars {
    #efs_mount_point = "${var.efs_mount_point}"   # I am sending the DNS name of the EFS mount point to user_data template
    efs_mount_point = "${aws_efs_mount_target.qa_efs_mount_target_west_2a.dns_name}" 
    #var2  = "${var.var2}"
    efs_mount_point_2 = "${aws_efs_mount_target.copy_destination_mount_target_west_2a.dns_name}" 
  }

}

resource "aws_instance" "testing_code_host" {
  # first amazon linux on the console:  ami-e251209a
  ami = "ami-e251209a"
  instance_type = "t1.micro"
  subnet_id = "${module.subnet_public_west_2a.created_subnet_id}"
  vpc_security_group_ids =
    [
     "${aws_security_group.ping_only_mybigfatcompany.id}", 
     "${aws_security_group.ping_only_qa_vpc.id}", 
     "${aws_security_group.ssh_only_qavpc.id}", 
     "${aws_security_group.sg_efs_qa.id}", 
     "${aws_security_group.sg_80_443_out.id}"
    ]
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

  user_data = "${data.template_file.user_data.rendered}"

}


output "private_ip_of_codetesting_host" {
  value = ["${aws_instance.testing_code_host.private_ip}"]
}

output "public_ip_of_codetesting_host" {
  value = ["${aws_instance.testing_code_host.public_ip}"]
}

