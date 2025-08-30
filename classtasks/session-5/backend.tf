terraform {
    backend "s3" {
        bucket = "apr2025-terraform-session-backend-e"
        key = "session-5/terraform.tfstate"
        region = "us-west-2"
        encrypt = true
    }
}