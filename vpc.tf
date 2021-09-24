# creating VPC
resource "aws_vpc" "t3640-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true" # provides internal domain name
  enable_dns_hostnames = "true" # provides internal host name
  enable_classiclink = "false"
  instance_tenancy = "default" #  VPC will be created on shared resources
  tags = {
    "Name" = "t3640-vpc"
  }
}

# creating external/public subnet
resource "aws_subnet" "t3640-ext-subnet" {
  vpc_id = aws_vpc.t3640-vpc.id
  cidr_block = "10.0.7.0/24"
  map_public_ip_on_launch = "true"  # it makes this a external/public subnet
  tags = {
      "Name" = "t3640-ext-subnet"
  }
}

# creating internal/private subnet
resource "aws_subnet" "t3640-int-subnet" {
  vpc_id = aws_vpc.t3640-vpc.id
  cidr_block = "10.0.8.0/24"
  map_public_ip_on_launch = "false"
  tags = {
      "Name" = "t3640-int-subnet"
  }
}