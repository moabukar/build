resource "aws_launch_configuration" "zadni" {
    name_prefix = "zadni-"

    image_id        = "${var.ami}"
    instance_type   = "${var.instance_type}"
    key_name        = "${var.key_name}"

    security_groups = [ "${aws_security_group.zadni.id}" ]

    lifecycle {
        create_before_destroy = true
    }
}

output "aws_launch_configuration" {
    value = "${aws_launch_configuration.zadni.name}"
}

