// Mote Terraform does not let you call variable inside of a varibale , insted we use locals 
locals {
    name = "${var.env}-${var.aws_region}-${var.tier}-${var.cloud_provider}-${var.project}-${var.managed_by}-${var.owner}-rtype"
    
    common_tags = {
        Environment = var.env
        Tier = var.tier
    }
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
