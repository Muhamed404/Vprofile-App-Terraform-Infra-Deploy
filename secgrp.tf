
##Security Group For Beanstack lb 
resource "aws_security_group" "vprofile-bean-elb-sg" {
  name        = "vprofile-bean-elb-sg"
  description = "Security group for bean-elb"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name      = "vprofile-bean-elb"
    ManagedBy = "Terraform"
    Project   = "Vprofile"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_from_anywhere" {
  security_group_id = aws_security_group.vprofile-bean-elb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_for_elb" {
  security_group_id = aws_security_group.vprofile-bean-elb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6_for_elb" {
  security_group_id = aws_security_group.vprofile-bean-elb-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

##Security Group For Bastion Host 

resource "aws_security_group" "vprofile-bastion-sg" {
  name        = "vprofile-bastion-sg"
  description = "Security group for bastion Host"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name      = "vprofile-bastion"
    ManagedBy = "Terraform"
    Project   = "Vprofile"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_anywhere_for_bastion" {
  security_group_id = aws_security_group.vprofile-bastion-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_for_bastion" {
  security_group_id = aws_security_group.vprofile-bastion-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6_for_bastion" {
  security_group_id = aws_security_group.vprofile-bastion-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

##Security Group For Beanstack Instances 

resource "aws_security_group" "vprofile-bean-instances-sg" {
  name        = "vprofile-bean-instances-sg"
  description = "vprofile-bean-instances-sg"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name      = "vprofile-beanstackinstances "
    ManagedBy = "Terraform"
    Project   = "Vprofile"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_http_from_ELB" {
  security_group_id            = aws_security_group.vprofile-bean-instances-sg.id
  referenced_security_group_id = aws_security_group.vprofile-bean-elb-sg.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_anywhere_for_bean_instances" {
  security_group_id = aws_security_group.vprofile-bean-instances-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_bean_instances" {
  security_group_id = aws_security_group.vprofile-bean-instances-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6_bean_instances" {
  security_group_id = aws_security_group.vprofile-bean-instances-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}


##Security Group For Backend

resource "aws_security_group" "vprofile-backend-sg" {
  name        = "vprofile-backend-sg"
  description = "vprofile-backend-sg"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name      = "vprofile-backend "
    ManagedBy = "Terraform"
    Project   = "Vprofile"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_all_from_beaninstances" {
  security_group_id            = aws_security_group.vprofile-backend-sg.id
  referenced_security_group_id = aws_security_group.vprofile-bean-instances-sg.id
  ip_protocol                  = "-1"

}


resource "aws_vpc_security_group_ingress_rule" "allow_3306_from_bastionhost" {
  security_group_id            = aws_security_group.vprofile-backend-sg.id
  referenced_security_group_id = aws_security_group.vprofile-bastion-sg.id
  ip_protocol                  = "tcp"
  from_port                    = 3306
  to_port                      = 3306

}

resource "aws_vpc_security_group_ingress_rule" "allow_all_from_backend" {
  security_group_id            = aws_security_group.vprofile-backend-sg.id
  referenced_security_group_id = aws_security_group.vprofile-backend-sg.id
  ip_protocol                  = "-1"

}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_for_backend" {
  security_group_id = aws_security_group.vprofile-backend-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6_for_backend" {
  security_group_id = aws_security_group.vprofile-backend-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
