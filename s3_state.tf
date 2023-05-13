terraform {
  backend "s3" {
    bucket = "terraform-eks-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}