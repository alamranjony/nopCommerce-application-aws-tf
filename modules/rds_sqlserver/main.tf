resource "aws_security_group" "rds_sg" {
  name        = "drinkspot-rds-sg-${terraform.workspace}"
  description = "Allow application servers to access RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [var.app_security_group_id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.default_tags, {
    Name = "drinkspot-rds-sg-${terraform.workspace}"
  })
}

resource "aws_db_subnet_group" "rds_subnet" {
  name       = "drinkspot-rds-subnet-${terraform.workspace}"
  subnet_ids = var.private_subnet_ids

  tags = merge(var.default_tags, {
    Name = "drinkspot-rds-subnet-${terraform.workspace}"
  })
}

resource "random_password" "db_pass" {
  length           = 16
}

resource "aws_db_instance" "rds" {
  identifier             = "drinkspot-${terraform.workspace}-rds"
  engine                 = "sqlserver-web"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  username               = var.db_username
  password               = random_password.db_pass.result
  port                   = 1433
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot    = true
  publicly_accessible    = false
  multi_az               = false

  tags = merge(var.default_tags, {
    Name = "drinkspot-rds-instance-${terraform.workspace}"
  })
}
