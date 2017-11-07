variable "network_acl_id" {
  description = "The ID of the network ACL"
}

variable "rule_no" {
  description = "The number of priority to apply this rule"
}

variable "egress" {
  description = "Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet)"
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

variable "cidr_block" {
  description = "List of CIDR blocks. Cannot be specified with source_security_group_id"
}

variable "rule_action" {
  description = "Accepted values: allow | deny"
}
