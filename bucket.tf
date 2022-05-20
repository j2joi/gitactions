// Copyright (c) 2017, 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

/*
 * This example shows how to manage a bucket
 */

resource "oci_objectstorage_bucket" "bucket1" {
  compartment_id = var.compartment_ocid
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = var.bucket_name
  access_type    = "NoPublicAccess"
  auto_tiering = "Disabled"
}

resource "oci_objectstorage_bucket" "bucket_with_versioning" {
  compartment_id = var.compartment_ocid
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = "bucket-with-versioning"
  access_type    = "NoPublicAccess"
  versioning     = "Enabled"
}

data "oci_objectstorage_bucket_summaries" "buckets1" {
  compartment_id = var.compartment_ocid
  namespace      = data.oci_objectstorage_namespace.ns.namespace

  filter {
    name   = "name"
    values = [oci_objectstorage_bucket.bucket1.name]
  }
}

output "buckets" {
  value = data.oci_objectstorage_bucket_summaries.buckets1.bucket_summaries
}
