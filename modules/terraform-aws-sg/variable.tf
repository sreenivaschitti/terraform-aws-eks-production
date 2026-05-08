variable "project" {
  type = string
}

variable "environment" {

    type = string

    validation {
      condition = contains(
        ["dev", "qa", "uat", "prod"], 
        var.environment
        )
      error_message = "Environments should be one of dev, qa, uat or prod"
    }
  
}

variable "sg_name" {

    type = string
  
}

variable "sg_tags" {

    type = string
  
}

variable "vpc_id" {

    type = string
  
}