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

# resource "aws_subnet" "public" {
#   count = length(var.public_subnet_cidr)  
#   vpc_id     = aws_vpc.main.id
#   cidr_block = var.public_subnet_cidr[count.index]


#   tags = {
#     Name = "Main"
#   }
# }