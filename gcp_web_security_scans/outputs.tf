# Display Names of the scan configs being created passed back to the caller template
output "mod_scan_display_names" {
  value = [for scan in google_security_scanner_scan_config.scans : scan.display_name]
}

# ids of the scan configs being created passed back to the caller template
output "mod_scan_ids" {
  value = [for scan in google_security_scanner_scan_config.scans : scan.id]
}