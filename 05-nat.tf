# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat

# For Iowa
resource "google_compute_router_nat" "hq-nat" {
  name   = "hq-nat"
  router = google_compute_router.hq-router.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.hq-internal.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.hq-nat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "hq-nat" {
  name         = "hq-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-central1"
}

# For Iowa-App1
resource "google_compute_router_nat" "hq-nat-app1" {
  name   = "hq-nat-app1"
  router = google_compute_router.hq-router-app1.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.hq-app1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.hq-nat-app1.self_link]
}


resource "google_compute_address" "hq-nat-app1" {
  name         = "hq-nat-app1"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-central1"
}

# For Lima
resource "google_compute_router_nat" "lima-nat" {
  name   = "lima-nat"
  router = google_compute_router.lima-router.name
  region = "southamerica-west1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.lima-subnet-01.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.lima-nat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "lima-nat" {
  name         = "lima-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "southamerica-west1"
}

# For Lima-app1
resource "google_compute_router_nat" "lima-nat-app1" {
  name   = "lima-nat-app1"
  router = google_compute_router.lima-router-app1.name
  region = "southamerica-west1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.lima-app1.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.lima-nat-app1.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "lima-nat-app1" {
  name         = "lima-nat-app1"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "southamerica-west1"
}