# Copyright © 2020, Oracle and/or its affiliates. 
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

// Basic Hidden
variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "region" {}

// Extra Hidden
variable "user_ocid" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "private_key_path" {
  default = ""
}

// General Configuration
variable "proj_abrv" {
  default = "apexvan"
}

// Block APEX/ORDS Dev and Admin Tools 
variable "enable_lbaas_ruleset" {
  default = "false"
}

variable "adb_license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
}

variable "adb_cpu_core_count" {
  default = 1
}

variable "adb_dataguard" {
  default = false
}

variable "adb_storage_size_in_tbs" {
  default = 1
}

variable "adb_db_version" {
  default = "19c"
}

//LBaaS Shape
variable "flex_lb_min_shape" {
  default = 10
}

variable "flex_lb_max_shape" {
  default = 1250
}

// VCN Configurations Variables
variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "vcn_is_ipv6enabled" {
  default = false
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

// Additional Resources
variable "prov_object_storage" {
  default = "false"
}

variable "prov_data_safe" {
  default = "false"
}

variable "prov_oic" {
  default = "false"
}

variable "enable_lb_logging" {
  default = "false"
}