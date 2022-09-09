provider "aws" {
	region = "eu-west-3"
}

resource "aws_vpc" "<##INFRA_NAME##>-vpc" {
	cidr_block = "10.0.0.0/16"

	tags = {
		Name = "<##INFRA_NAME##>-vpc"
	}
}

resource "aws_subnet" "<##INFRA_NAME##>-pub" {
	vpc_id = "${aws_vpc.<##INFRA_NAME##>-vpc.id}"
	cidr_block = "10.0.1.0/24"

	tags = {
		Name = "<##INFRA_NAME##>-pub"
	}
}

resource "aws_internet_gateway" "<##INFRA_NAME##>-igw" {
	vpc_id = "${aws_vpc.<##INFRA_NAME##>-vpc.id}"

	tags = {
		Name = "<##INFRA_NAME##>-igw"
	}
}

resource "aws_route" "<##INFRA_NAME##>-defroute" {
	route_table_id = "${aws_vpc.<##INFRA_NAME##>-vpc.default_route_table_id}"
	destination_cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.<##INFRA_NAME##>-igw.id}"
}

resource "aws_instance" "<##INFRA_NAME##>-INSTANCE-WEB" {
        key_name = "test_keypair"
        ami = "ami-09e513e9eacab10c1"
	instance_type = "t2.micro"
	user_data = "${file("httpd.sh")}"
	associate_public_ip_address = "true"	

        tags = {
                Name = "<##INFRA_NAME##>-INSTANCE-WEB"
        }
}
