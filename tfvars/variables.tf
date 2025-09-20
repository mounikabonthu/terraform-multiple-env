variable "project"{
    default = "expense"
}
variable "environment" {
    
}
variable "instances" {
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z102696223PPV1KEL59YX"
}

variable "domain_name" {
    default = "monidevopsaws.online"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Terraform = "true"
    }
}

