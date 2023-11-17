
variable "region" {
  default = "eu-west-1"
}
variable "instance_type" {
  default = "t3.nano"
}

variable "ami" {
  default = "ami-0694d931cee176e7d"
}

variable "keyname" {
  default = "linux"

}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr_zonea" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_zoneb" {
  default = "10.0.2.0/24"
}

variable "public_subnet_cidr_zonea" {
  default = "10.0.3.0/24"
}

variable "public_subnet_cidr_zoneb" {
  default = "10.0.4.0/24"
}

variable "nat_subnet_cidr_zonea" {
  default = "10.0.10.0/24"
}

variable "nat_subnet_cidr_zoneb" {
  default = "10.0.11.0/24"
}

variable "public_route" {
  default = "0.0.0.0/0"

}

variable "server_port" {
  type    = number
  default = 8080
}

variable "elb_port" {
  type    = number
  default = 80
}

variable "max_size" {
  default = 2
}

variable "min_size" {
  default = 1

}
variable "desired_capacity" {
  default = 1
}