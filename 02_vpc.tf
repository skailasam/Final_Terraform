# vpc

resource "aws_vpc" "Final_vpc" {
  cidr_block = var.vpc_cidr
}



# subnet

resource "aws_subnet" "Final_pub_subnet" {
    vpc_id = var.vpc_id
    count = length(var.Final_pub_subnet)
    cidr_block = var.Final_pub_subnet[count.index]
    availability_zone = "${var.region}${var.zone[count.index]}"
    depends_on = [
      var.vpc
    ]
    tags = {
      Name = "Final-pub-subnet-${var.zone[count.index]}"
    }
}

resource "aws_subnet" "Final_web_subnet" {
    vpc_id = var.vpc_id
    count = length(var.Final_web_subnet)
    cidr_block = var.Final_web_subnet[count.index]
    availability_zone = "${var.region}${var.zone[count.index]}"
    depends_on = [
      var.vpc
    ]
    tags = {
      Name = "Final-web-subnet-${var.zone[count.index]}"
    }
}

resource "aws_subnet" "Final_was_subnet" {
    vpc_id = var.vpc_id
    count = length(var.Final_was_subnet)
    cidr_block = var.Final_was_subnet[count.index]
    availability_zone = "${var.region}${var.zone[count.index]}"
    depends_on = [
      var.vpc
    ]
    tags = {
      Name = "Final-was-subnet-${var.zone[count.index]}"
    }
}

resource "aws_subnet" "Final_db_subnet" {
    vpc_id = var.vpc_id
    count = length(var.Final_db_subnet)
    cidr_block = var.Final_db_subnet[count.index]
    availability_zone = "${var.region}${var.zone[count.index]}"
    depends_on = [
      var.vpc
    ]
    tags = {
      Name = "Final-db-subnet-${var.zone[count.index]}"
    }
}