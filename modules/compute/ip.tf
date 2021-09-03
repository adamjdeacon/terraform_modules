resource "google_compute_address" "ip" {
  name    = "ext-${var.customer_name}"
}