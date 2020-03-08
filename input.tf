variable "project" {
  type    = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "network_name" {
  type    = string
  default = "default"
}

variable "cloud_flare_api_token" {
  type    = string
}

variable "cloudflare_zone_id" {
  type    = string
}