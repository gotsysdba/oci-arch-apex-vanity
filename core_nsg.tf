# Copyright © 2020, Oracle and/or its affiliates. 
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

// Security Group for Load Balancer (lb)
resource "oci_core_network_security_group" "security_group_lb" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-security-group-lb", var.proj_abrv)
}
// Security Group for Load Balancer (lb) - EGRESS
resource "oci_core_network_security_group_security_rule" "security_group_lb_egress" {
  network_security_group_id = oci_core_network_security_group.security_group_lb.id
  direction                 = "EGRESS"
  protocol                  = "6"
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}
// Security Group for Load Balancer (lb) - INGRESS
resource "oci_core_network_security_group_security_rule" "security_group_lb_inress_TCP80" {
  network_security_group_id = oci_core_network_security_group.security_group_lb.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}
resource  "oci_core_network_security_group_security_rule" "security_group_lb_inress_TCP443" {
  network_security_group_id = oci_core_network_security_group.security_group_lb.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 443
      min = 443
    }
  }
}

resource "oci_core_network_security_group" "security_group_adb" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-security-group-adb", var.proj_abrv)
}
// Security Group for ADB - INGRESS
resource "oci_core_network_security_group_security_rule" "security_group_adb_ingress_TCP443" {
  network_security_group_id = oci_core_network_security_group.security_group_adb.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = var.public_subnet_cidr
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 443
      min = 443
    }
  }
}