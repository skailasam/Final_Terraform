# internet gateway

resource "aws_internet_gateway" "Final_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Final-igw"
  }
}






# nat gateway

resource "aws_eip" "Final_nat_eip" {
  count = length(var.zone)
  vpc      = true
}

resource "aws_nat_gateway" "Final_ngw" {
  count = length(var.zone)
  allocation_id = aws_eip.Final_nat_eip[count.index].id
  subnet_id     = aws_subnet.Final_pub_subnet[count.index].id

  tags = {
    Name = "Final-ngw-${var.zone[count.index]}"
  }
}