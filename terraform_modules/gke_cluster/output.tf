output "name" {
  description = "name"
  value       = google_container_cluster.foobar.name
}

output "initial_node_count" {
  description = "initial_node_count"
  value       = google_container_cluster.foobar.initial_node_count
}

