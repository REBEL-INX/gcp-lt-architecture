# For main VPC
resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main.name
  # direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

#  Allow Wed trafic Firewall rule
resource "google_compute_firewall" "allow_web" {
  name        = "allow-web-traffic"
  network     = google_compute_network.main.name
  description = "HTTP traffic for NGNX re"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# #allow_dns
resource "google_compute_firewall" "allow_dns" {
  name        = "allow-dns"
  network     = google_compute_network.main.name
  description = "HTTP traffic for NGNX re"

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "icmp" {
  name        = "icmp"
  network     = google_compute_network.main.name
  description = "Allow ICMP"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

# # Allow Databases

resource "google_compute_firewall" "allow-db" {
  name        = "allow-db"
  network     = google_compute_network.main.name
  description = "Allow Databases"

  allow {
    protocol = "tcp"
    ports    = ["3306", "1521"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# # Allow RDP

resource "google_compute_firewall" "allow-rdp" {
  name        = "allow-rdp"
  network     = google_compute_network.main.name
  description = "Allow RDP"

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}

