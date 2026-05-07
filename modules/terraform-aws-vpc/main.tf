resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = local.vpc_finaltags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = local.igw_finaltags
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true
 tags = merge(

            local.commontags,
            { Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
             },

             var.public_subnet_tags

    )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]
 tags = merge(

            local.commontags,
            { Name = "${var.project}-${var.environment}-private-${local.az_names[count.index]}"
             },

             var.private_subnet_tags

    )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidr)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]
 tags = merge(

            local.commontags,
            { Name = "${var.project}-${var.environment}-database-${local.az_names[count.index]}"
             },

             var.database_subnet_tags

    )
}