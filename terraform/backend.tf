terraform {
  backend "s3" {
    bucket = "terraform-state-nidheiii-001"
    key    = "event-driven-pipeline/terraform.tfstate"
    region = "ap-south-1"
  }
}
