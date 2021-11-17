# public route table

resource "aws_route_table" "Final_rt_pub" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.Final_igw.id
  }

  tags = {
    Name = "Final-rt-pub"
  }
}

# public route table ass

resource "aws_route_table_association" "Final_rt_pub_ass" {
  count = length(var.zone)
  subnet_id      = aws_subnet.Final_pub_subnet[count.index].id
  route_table_id = aws_route_table.Final_rt_pub.id
}







# private route table

resource "aws_route_table" "Final_rt_pri" {

  count = length(var.zone)
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_nat_gateway.Final_ngw[count.index].id
  }

  tags = {
    Name = "Final-rt-pri-${var.zone[count.index]}"
  }
}

# private route table ass

resource "aws_route_table_association" "Final_rt_web_ass" {
  count          =  length(var.zone)  
  subnet_id      = aws_subnet.Final_web_subnet[count.index].id
  route_table_id = aws_route_table.Final_rt_pri[count.index].id
}

resource "aws_route_table_association" "Final_rt_was_ass" {
  count          =  length(var.zone)  
  subnet_id      = aws_subnet.Final_was_subnet[count.index].id
  route_table_id = aws_route_table.Final_rt_pri[count.index].id
}

