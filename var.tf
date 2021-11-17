# region & vpc
variable "region" {
  description = "aws seoul region"
  default = "ap-northeast-2"
}

variable "vpc_cidr" {
  description = "Final_vpc cidr"
  default = "10.0.0.0/16"
}

variable "vpc" {
  description = "Final_vpc"
  default = "aws_vpc.Final_vpc"
}

variable "vpc_id" {
  description = "Final_vpc ID"
  default = "aws_vpc.Final_vpc.id"
}


# subnet

variable "Final_pub_subnet" {
  description = "Final pub subnet for mgmt"
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "Final_web_subnet" {
  description = "Final web subnet for web server"
  default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "Final_was_subnet" {
  description = "Final was subnet for was server"
  default = ["10.0.5.0/24","10.0.6.0/24"]
}

variable "Final_db_subnet" {
  description = "Final db subnet for RDS"
  default = ["10.0.7.0/27","10.0.7.32/27"]
}

variable "zone" {
  description = "aws AZ"
  default = ["a","c"]
}





# Route Table

variable "cidr_block" {
  description = "All IP"
  default = "0.0.0.0/0"
}

variable "ipv6_cidr_blocks" {
  description = "All IPv6"
  default = "::/0"
}




# instance

variable "ami" {
  description = "aws ami"
  default = "ami-0252a84eb1d66c2a0"
}


variable "key_pair" {
  description = "aws key_pair"
  default = "btc_yj_edu"
}