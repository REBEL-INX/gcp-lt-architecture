# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router

# For Iowa
resource "google_compute_router" "hq-router" {
  name    = "hq-router"
  region  = "us-central1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "hq-router-app1" {
  name    = "hq-router-app1"
  region  = "us-central1"
  network = google_compute_network.prod1.id
}

# For Lima
resource "google_compute_router" "lima-router" {
  name    = "lima-router"
  region  = "southamerica-west1"
  network = google_compute_network.main.id
}

resource "google_compute_router" "lima-router-app1" {
  name    = "lima-router-app1"
  region  = "southamerica-west1"
  network = google_compute_network.prod1.id
}

# For Phnom Penh
resource "google_compute_router" "phnom-penh-router" {
  name    = "phnom-penh-router"
  region  = "asia-southeast1"
  network = google_compute_network.main.id
}
resource "google_compute_router" "phnom-penh-router-app1" {
  name    = "phnom-penh-router-app1"
  region  = "asia-southeast1"
  network = google_compute_network.prod1.id
}

# For Zagreb
resource "google_compute_router" "zagreb-router" {
  name    = "zagreb-router"
  region  = "europe-central2"
  network = google_compute_network.main.id
}

resource "google_compute_router" "zagreb-router-app1" {
  name    = "zagreb-router-app1"
  region  = "europe-central2"
  network = google_compute_network.prod1.id
}
