terraform {
  backend "s3" {
    bucket         = "terraform-state-reef"  
    key            = "terraform.tfstate"  
    encrypt        = true
    region         = "us-east-1"
  }
}