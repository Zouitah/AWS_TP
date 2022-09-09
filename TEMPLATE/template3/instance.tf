resource "aws_network_interface" "<##INFRA_NAME##>-<##NUMERO_INSTANCE##>-INSTANCE-WEB-IP" {
	subnet_id = "${aws_subnet.<##INFRA_NAME##>-priv.id}"
	private_ips = ["10.0.2.<##NUMERO_INSTANCE##>"]
	
	tags = {
		Name = "<##INFRA_NAME##>-INSTANCE-WEB-IP"
	}
}

resource "aws_network_interface_sg_attachment" "<##INFRA_NAME##>-<##NUMERO_INSTANCE##>-INSTANCE-WEB-IP-SG-ATTACH" {
	security_group_id = "${aws_security_group.<##INFRA_NAME##>-SG-WEB.id}"
	network_interface_id = "${aws_network_interface.<##INFRA_NAME##>-<##NUMERO_INSTANCE##>-INSTANCE-WEB-IP.id}"
}

resource "aws_instance" "<##INFRA_NAME##>-<##NUMERO_INSTANCE##>-INSTANCE-WEB" {
        key_name = "test_keypair"
        ami = "ami-09e513e9eacab10c1"
	instance_type = "t2.micro"
	user_data = "${file("httpd.sh")}"

	network_interface {
		network_interface_id = "${aws_network_interface.<##INFRA_NAME##>-<##NUMERO_INSTANCE##>-INSTANCE-WEB-IP.id}"
		device_index = 0
	}

        tags = {
                Name = "<##INFRA_NAME##>-<##NUMERO_INSTANCE##>-INSTANCE-WEB"
        }
}