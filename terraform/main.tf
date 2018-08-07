provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "172.22.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "172.22.0.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route_table" "public_routetable" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }
}

resource "aws_route_table_association" "subnet_a" {
  subnet_id      = "${aws_subnet.subnet_a.id}"
  route_table_id = "${aws_route_table.public_routetable.id}"
}
