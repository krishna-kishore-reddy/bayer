terraform {
  backend "s3" {
    bucket         = "searchstay-terraform-state-b"
    key            = "terraform.tfstate"
    region         = "ap-south-2"
    encrypt        = true
  }
}

