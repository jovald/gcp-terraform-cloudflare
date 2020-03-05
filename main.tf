provider "google" {
  credentials = file("account.json")
  project     = var.project
  region      = var.region
}

resource "google_compute_instance" "webserver" {
  name         = "webserver"
  machine_type = "f1-micro"
  zone         = var.zone

  tags = ["webserver"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  hostname = "staches.org"

  metadata_startup_script = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 80 &
              EOF

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

data "google_compute_network" "default" {
  name = var.network_name
}

resource "google_compute_firewall" "default" {
  name    = "default-allow-http"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}