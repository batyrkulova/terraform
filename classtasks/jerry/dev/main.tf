module "ec2" {
  source                 = "../../modules/ec2"
  ami                    = "ami-01102c5e8ab69fb75"
  instance_type          = "t3.micro"
  env                    = "dev"
  vpc_security_group_ids = [module.sg.security_group_id] //reference to child module ouputs module.module_name.output 
}

module "sg" {
  source      = "../../modules/sg"
  name        = "terraform-modules-sg"
  description = "This is a security group for terraform instance"
}


module "ec2k" {
  source = "github.com/aKumoSolutions/apr2025-terraform-session/classtask/modules/ec2" // Where the child module is. You can call child modules locally or remotely
############## Input Variables ##################
  ami = "ami-01102c5e8ab69fb75"
  instance_type = "t3.micro"
  env = "dev"
  vpc_security_group_ids = [ module.sg.security_group_id ] // Reference to child module outputs // Syntax: module.module_name.output
}

module "ksg" {
  source = "github.com/aKumoSolutions/apr2025-terraform-session/classtask/modules/sg"
############## Input Variables ##################
  name = "terraform-module-sg-main"
  description = "This is a security group for terraform instance"
}

// terraform always look in to default branch 