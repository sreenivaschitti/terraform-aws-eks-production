locals {
  commontags = {

        Project = var.project
        Environment = var.environment
        Terraform = true
        }

    sg_finaltags = merge(
        
            var.sg_tags,

            local.commontags,
            { Name = "${var.project}-${var.environment}-${var.sg_name}"
            }
            

    )    

}