variable "VPC_CIDR" {
  type        = string
  description = ""
}

variable "PUCLIC_SUBNET_1_CIDR" {
  type        = string
  description = ""
}

variable "PUCLIC_SUBNET_2_CIDR" {
  type        = string
  description = ""
}

variable "PUCLIC_SUBNET_3_CIDR" {
  type        = string
  description = ""
}

variable "PRIVATE_SUBNET_1_CIDR" {
  type        = string
  description = ""
}

variable "PRIVATE_SUBNET_2_CIDR" {
  type        = string
  description = ""
}

variable "PRIVATE_SUBNET_3_CIDR" {
  type        = string
  description = ""
}

variable "AZ_1" {
  type        = string
  description = ""
}

variable "AZ_2" {
  type        = string
  description = ""
}

variable "AZ_3" {
  type        = string
  description = ""
}


variable "EC2_AMI" {
  type        = string
  description = ""
}

variable "EC2_TYPE" {
  type        = string
  description = ""
}

variable "REGION" {
  type        = string
  description = ""
}

variable "EC2_COUNT" {
  type        = number
  description = ""
}

variable "DB_NAME" {
  type        = string
  description = ""
}
variable "DB_ENGINE" {
  type        = string
  description = ""
}
variable "DB_INSTANCE_CLASS" {
  type        = string
  description = ""
}
variable "DB_ENGINE_VERSION" {
  type        = string
  description = ""
}

variable "SECRET_ARN" {
  type        = string
  description = ""
}

variable "CHACHE_NODE_TYPE" {
  type        = string
  description = ""
}

variable "CHACHE_NODE_NUM" {
  type        = number
  description = ""
}

variable "CHACHE_ENGINE_VERSION" {
  type        = string
  description = ""
}
