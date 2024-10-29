terraform {
  backend "s3" {
    bucket = "redline-1117"
    key    = "day-2/terraform.tfstate"
    region = "us-west-1"
  }
}