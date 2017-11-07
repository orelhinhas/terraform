variable "type" {
  description = "The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
}

variable "from_port" {
  description = "The start port"
}

variable "to_port" {
  description = "The end port"
}

variable "protocol" {
  description = "The protocol. If not icmp, tcp, udp, or all use the protocol number"
}

variable "cidr_blocks" {
  type        = "list"
  description = "List of CIDR blocks. Cannot be specified with source_security_group_id"
}

variable "security_group_id" {
  description = "The security group to apply this rule to."
}
