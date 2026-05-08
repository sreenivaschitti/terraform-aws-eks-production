module "sg" {

count = length(var.sg_names)

    source = "git::https://github.com/sreenivaschitti/terraform-aws-eks-production.git//modules/terraform-aws-sg?ref=main"

 sg_name     = replace(var.sg_names, "_", "-")

 vpc_id = local.vpc_id
 
 project = var.project

 environment = var.environment

}