# create internet gateway
resource "aws_internet_gateway" "t3640-igw" {
  vpc_id = aws_vpc.t3640-vpc.id
  tags = {
    "Name" = "t3640-igw"
  }
}

# create public route table
resource "aws_route_table" "t3640-pubRT" {
  vpc_id = aws_vpc.t3640-vpc.id
  route {
    cidr_block = "0.0.0.0/0"  # associated subnet can reach everywhere
    gateway_id = aws_internet_gateway.t3640-igw.id # public RT uses this IGW to reach internet
    egress_only_gateway_id = null
    instance_id = null
    ipv6_cidr_block = null
    local_gateway_id = null
    nat_gateway_id = null
    network_interface_id = null
    transit_gateway_id = null
    vpc_endpoint_id = null
    vpc_peering_connection_id = null
  }
}

# associate public route table and public subnet
resource "aws_route_table_association" "t3640-pubRT-pubSN" {
  subnet_id = aws_subnet.t3640-ext-subnet.id
  route_table_id = aws_route_table.t3640-pubRT.id
}

# create elastic IP
resource "aws_eip" "t3640_eip" {
  tags = {
    "Name" = "t3640_eip"
  }
}

# create NAT gateways
resource "aws_nat_gateway" "t3640-nat" {
  allocation_id = aws_eip.t3640_eip.id
  subnet_id = aws_subnet.t3640-ext-subnet.id
  tags = {
    "Name" = "t3640-nat"
  }
}

# create private route table
resource "aws_route_table" "t3640-priRT" {
  vpc_id = aws_vpc.t3640-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.t3640-nat.id
    egress_only_gateway_id = null
    instance_id = null
    ipv6_cidr_block = null
    local_gateway_id = null
    nat_gateway_id = null
    network_interface_id = null
    transit_gateway_id = null
    vpc_endpoint_id = null
    vpc_peering_connection_id = null
  }
}

# associate private route table and private subnet
resource "aws_route_table_association" "t3640-priRT-priSN" {
  subnet_id = aws_subnet.t3640-int-subnet.id
  route_table_id = aws_route_table.t3640-priRT.id
}