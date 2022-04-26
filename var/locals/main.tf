locals {
    common_tags = {
        "CC" = "101010"
        "Team" = "EC"
        "Compliance" = "SOX"
    }
}

resource "aws_instance" "prod" {
    ami =  "ami-04902260ca3d33422"
    instance_type = "t3.medium"

    tags = local.common_tags

}