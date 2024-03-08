variable "do_token" {
  type = string
  default = "dop_v1_8fadfbfea2089947dbd634c58c15c484761381c80970766a35f5f0fb20488042"
  sensitive = true
  
}

variable "cluster_name" {
  type = string
  default = "terraformk8s"
}

variable "k8s_version" {
  type = string
  default = "1.29.1-do.0"
}

variable "region" {
  type = string
  default = "sgp1"
}