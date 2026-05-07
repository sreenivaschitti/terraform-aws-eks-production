locals {
  commontags = {

        Project = var.project
        Environment = var.environment
        Terraform = true
        }

    vpc_finaltags = merge(

            local.commontags,
            { Name = "${var.project}-${var.environment}-vpc"
            },
            var.vpc_tags

    )    


    igw_finaltags = merge(

            local.commontags,
            { Name = "${var.project}-${var.environment}-igw"
            },
            var.igw_tags

    )    

    az_names = slice(data.aws_availability_zones.available.names, 0, 2)

   

}