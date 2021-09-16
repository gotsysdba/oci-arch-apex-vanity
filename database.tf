# Copyright © 2020, Oracle and/or its affiliates. 
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "random_password" "autonomous_database_password" {
  length           = 16
  min_numeric      = 1
  min_lower        = 1
  min_upper        = 1
  min_special      = 1
  override_special = "_#"
  keepers = {
    uuid = "uuid()"
  }
}

resource "oci_database_autonomous_database" "autonomous_database" {
  admin_password           = random_password.autonomous_database_password.result
  compartment_id           = var.compartment_ocid
  db_name                  = format("%sDB", upper(var.proj_abrv))
  cpu_core_count           = var.adb_cpu_core_count
  data_storage_size_in_tbs = var.adb_storage_size_in_tbs
  db_version               = var.adb_db_version
  db_workload              = "OLTP"
  display_name             = format("%sDB", upper(var.proj_abrv))
  is_free_tier             = false
  is_auto_scaling_enabled  = true
  license_model            = var.adb_license_model
  whitelisted_ips          = []
  nsg_ids                  = [ oci_core_network_security_group.security_group_adb.id ]
  subnet_id                = oci_core_subnet.subnet_private.id
  // This should be variabled but there's an issue with creating DG on initial creation
  is_data_guard_enabled    = false
  lifecycle {
    ignore_changes = all
  }
}