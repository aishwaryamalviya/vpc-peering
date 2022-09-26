provider "random" {}

provider "aws" {
  alias  = "peer"
  region = "us-east-1"
}

provider "aws" {
  region = "us-east-1"
}

