resource "google_compute_instance" "srv-gcp-ms-bob" {
  name         = "srv-gcp-bob-${var.customer_name}"
  allow_stopping_for_update = true
  machine_type = var.machine_type
  tags         = var.tags
  labels = var.labels
  service_account {
    email = var.compute_service_account
  #   scopes from https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes
    scopes = ["logging-write", "monitoring-write", "pubsub", "service-control", "service-management", "storage-ro", "https://www.googleapis.com/auth/trace.append"]
  }
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {
      //nat_ip = google_compute_address.ip.address
    }
  }
}