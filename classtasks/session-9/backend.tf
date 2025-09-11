terraform {
    backend "s3" {
        bucket = "apr2025-terraform-session-backend-e"
        key = "session9/terraform.tfstate"
        region = "us-west-2"
        encrypt = true
        dynamodb_table = "Terraform-state-locking"
    }
}