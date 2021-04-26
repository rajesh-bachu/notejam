# resource "aws_security_group" "rds_sg" {
#   description = "Access for RDS service"
#   name        = "${local.prefix}-rds-sg"
#   vpc_id      = "vpc-e84dd882"


#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = local.common_tags

# }

# resource "aws_db_instance" "dbinstance" {
#   allocated_storage = 10
#   engine            = "postgres"
#   #engine_version       = "5.7"
#   instance_class      = "db.t2.micro"
#   name                = "mydb"
#   username            = "foo"
#   password            = "foobarbaz"
#   publicly_accessible = "true"
#   #parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot    = true
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]
#   identifier             = "${local.prefix}-dbinstance"
# }
