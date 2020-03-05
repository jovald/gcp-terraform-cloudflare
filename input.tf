variable "project" {
  type    = string
  default = "in3-test-2"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "domain" {
  default = "staches.org"
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