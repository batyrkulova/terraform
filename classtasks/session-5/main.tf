resource "aws_sqs_queue" "main" {
    name = replace(local.name, "rtype", "sqs" )
    tags = merge(
    local.common_tags, 
    {Name = replace(local.name, "rtype", "sqs")}
    )
}

resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype", "rds") // databse Instnance Idenfifier
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = random_password.password.result
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = var.env != "prod" ? true : false //dev != prod > true
  snapshot_identifier = var.env != "prod" ? "${replace(local.name, "rtype", "rds-snapshot")}" : null
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "example" {
  instance_class    = "db.t3.micro"
  allocated_storage = 64
  engine            = "mysql"
  username          = "someone"
  password          = random_password.password.result
}


// Namming convention / standard 
// Project name = jerry
// Resource name = alb, asg, tg, igw
// Environment name = dev, qa, stq, prod 
// Region = use1, usw1, use2, usw2
// Tier = fronted, backend , db
// Bisiness Unit = orders, payments, streaming
// Provider name = aws, azure, gcp, do ,alibaba 

// Name example = aws-usw2-dev-orders-jerry-db-alb

// Tagging Convention / Standard 
// ENV = dev, qa, stg, prod
// tier =frontend , backend ,db
// project name = jerry , tom
// team = Devops, Cloud, Development, QA
// Managed_by = terraform , cloudformation, manual, python, go, plumni
// owner = elsu@akumosolutionsxcom


// Bool = true, false = | 0, 1
// Equality operators 
// "a" == """"""a" > true
// "b" != "a" > true 
// "b" == "b" > error
//  8 = "8" > false

//Conditions 
# example :
# "tomato" == "tomate" ? "fruit" : "vegie"
