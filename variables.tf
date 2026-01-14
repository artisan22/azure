variable "location" {
  description = "Azure region for the resource group and VNet."
  type        = string
  default     = "australiaeast"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-basic-vnet"
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "vnet-basic"
}

variable "vnet_cidr" {
  description = "Address space for the VNet."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "List of subnets to create (maximum of two)."
  type = list(object({
    name = string
    cidr = string
  }))

  default = [
    {
      name = "subnet-1"
      cidr = "10.0.1.0/24"
    },
    {
      name = "subnet-2"
      cidr = "10.0.2.0/24"
    }
  ]

  validation {
    condition     = length(var.subnets) <= 2
    error_message = "Provide no more than two subnets."
  }
}
