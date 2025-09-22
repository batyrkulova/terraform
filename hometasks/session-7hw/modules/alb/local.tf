locals {
    name = "${var.env}-${var.cloud_provider}-${var.cloud_region}-${var.business_unit}-${var.project}-${var.tier}-rtype"
    common_tags = {
        Environment = var.env
        Tier = var.tier
        Business_Unit = var.business_unit
        Project_Name = var.project
        Team = var.team
        Managed_By = var.managed_by
        Owner = var.owner
    }
}
