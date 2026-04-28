terraform {
  backend "s3" {
   bucket = "bg-advanced-tfstate"
   key    = "bg-advanced/terraform.tfstate"
   region = "eu-west-1"
   encrypt = true
  }
}
