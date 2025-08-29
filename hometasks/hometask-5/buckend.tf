terraform {
    backend "s3" {
        bucket = "apr2025-terraform-session-backend-e"
        key = "session3-hw/terraform.tfstate"
        region = "us-west-2"
        encrypt = true
    }
}