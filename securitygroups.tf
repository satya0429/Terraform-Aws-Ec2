# create security group
resource "aws_security_group" "t3640-sg" {
  vpc_id = aws_vpc.t3640-vpc.id
  egress = [ {          # outbound rules
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = -1
    to_port = 0
    "ipv6_cidr_blocks" = null,
    "prefix_list_ids" = null,
    "security_groups" = null,
    "self" = null,
    "description" = "outbound rules"
  } ]
  ingress = [ {         # inbound rule [ HTTP TCP 80 ]
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = "80"
    protocol = "tcp"
    to_port = "80"
    "ipv6_cidr_blocks" = null,
    "prefix_list_ids" = null,
    "security_groups" = null,
    "self" = null,
    "description" = "inbound rules"
  },
  {         # inbound rule [ HTTPS TCP 443 ]
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = "443"
    protocol = "tcp"
    to_port = "443"
    "ipv6_cidr_blocks" = null,
    "prefix_list_ids" = null,
    "security_groups" = null,
    "self" = null,
    "description" = "inbound rules"
  },
  {         # inbound rule [ SSH TCP 22 ]
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = "22"
    protocol = "tcp"
    to_port = "22"
    "ipv6_cidr_blocks" = null,
    "prefix_list_ids" = null,
    "security_groups" = null,
    "self" = null,
    "description" = "inbound rules"
  },
    {         # inbound rule [ ALl ICMP ]
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = "-1"
    protocol = "icmp"
    to_port = "-1"
    "ipv6_cidr_blocks" = null,
    "prefix_list_ids" = null,
    "security_groups" = null,
    "self" = null,
    "description" = "inbound rules"
  }
]
  tags = {
    "Name" = "t3640-sg"
  }
}