variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.9.0"

  name = "main"

  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a"]
  private_subnets = [cidrsubnet(var.vpc_cidr, 8, 0)]
  public_subnets  = [cidrsubnet(var.vpc_cidr, 8, 0)]

  assign_generated_ipv6_cidr_block = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "public"
  }

  tags = merge(
    local.common_tags,
    map(
      "Role", "MainVnet"
    )
  )

  vpc_tags = {
    Name = "main"
  }
}
