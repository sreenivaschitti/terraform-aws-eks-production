module "sg" {

for_each = toset(var.sg_names)

    source = "git::https://github.com/sreenivaschitti/terraform-aws-eks-production.git//modules/terraform-aws-sg?href=main"

 sg_name     = replace(each.key, "_", "-")
 
 project = var.project

 environment = var.environment

}