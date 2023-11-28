resource "aws_autoscaling_group" "build" {
    name = "build-autoscaling-group"

    depends_on = [ "aws_elb.build" ]

    availability_zones          = [ "${aws_elb.build.availability_zones}" ]
    min_size                    = 1
    max_size                    = 6
    desired_capacity            = 3
    force_delete                = true
    wait_for_capacity_timeout   = "3m"

    health_check_grace_period   = 300
    health_check_type           = "ELB"

    launch_configuration = "${aws_launch_configuration.build.name}"

    load_balancers = [ "${aws_elb.build.name}" ]

    user_data = "${template.cloud-init.rendered}"

    tag {
        key = "Name"
        value = "build"
        propagate_at_launch = true
    }
}

