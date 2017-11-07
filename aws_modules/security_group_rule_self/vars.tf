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

variable "security_group_id" {
  description = "The security group to apply this rule to."
}

variable "self" {
	description = "If true, the security group itself will be added as a source to this ingress rule."
}
