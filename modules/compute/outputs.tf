output "ip" {
  description = "Public IP"
  value = google_compute_instance.instance.name
}