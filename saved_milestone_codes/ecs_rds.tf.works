/*====
RDS
======*/

variable "multi_az" {
  default = "false"
}

variable "allocated_storage" {
  default = "5"
}


variable "instance_class" {
  default = "db.r4.large"
}


variable "database_name" {
  default = "ecs_db_foobar"
}

variable "database_username" {
  default = "dba1"
}

variable "database_password" {
  default = "Abkt56789"
}



/* subnet used by rds */
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.environment}-rds-subnet-group"
  description = "RDS subnet group"
  #subnet_ids  = ["${var.subnet_ids}"]
  subnet_ids     = ["${element(aws_subnet.public_subnet.*.id, 0)}", "${element(aws_subnet.public_subnet.*.id, 1)}"]
  tags {
    Environment = "${var.environment}"
  }
}

/* Security Group for resources that want to access the Database */
resource "aws_security_group" "db_access_sg" {
  #vpc_id      = "${var.vpc_id}"
  vpc_id       = "${aws_vpc.vpc.id}"
  name        = "${var.environment}-db-access-sg"
  description = "Allow access to RDS"

  tags {
    Name        = "${var.environment}-db-access-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "rds_sg" {
  name = "${var.environment}-rds-sg"
  description = "${var.environment} Security Group"
  #vpc_id = "${var.vpc_id}"
  vpc_id       = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.environment}-rds-sg"
    Environment =  "${var.environment}"
  }

  // allows traffic from the SG itself
  ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      self = true
  }

  //allow traffic for TCP 5432
  ingress {
      from_port = 5432
      to_port   = 5432
      protocol  = "tcp"
      security_groups = ["${aws_security_group.db_access_sg.id}"]
  }

  // outbound internet access
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds" {
  identifier             = "${var.environment}-database"
  allocated_storage      = "${var.allocated_storage}"
  engine                 = "postgres"
  engine_version         = "9.6.6"
  instance_class         = "${var.instance_class}"
  multi_az               = "${var.multi_az}"
  name                   = "${var.database_name}"
  username               = "${var.database_username}"
  password               = "${var.database_password}"
  db_subnet_group_name   = "${aws_db_subnet_group.rds_subnet_group.id}"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  # commented out following line. was failing at apply time
  #snapshot_identifier    = "rds-${var.environment}-snapshot"
  tags {
    Environment = "${var.environment}"
  }
}
