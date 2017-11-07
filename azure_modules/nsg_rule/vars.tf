variable "nsg_rule_name" {
  description = "Network Security Group rule name"
}

variable "priority" {
  description = "Specifies the priority of the rule. The value can be between 100 and 4096"
}

variable "direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound” and Outbound"
}

variable "access" {
  description = "pecifies whether network traffic is allowed or denied. Possible values are Allow and Deny"
}

variable "protocol" {
  description = "Network protocol this rule applies to. Can be Tcp, Udp or * to match both"
}

variable "source_port_range" {
  description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any"
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used"
}

variable "destination_port_range" {
  description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any"
}

variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Security Rule"
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group that we want to attach the rule to"
}
