module "vpc" {

    source = "git::https://github.com/sreenivaschitti/terraform-aws-eks-production.git//modules/terraform-aws-vpc?ref=main"
  
}