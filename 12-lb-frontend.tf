# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
# Resource: Reserve global Static IP Address
resource "google_compute_global_address" "lb" {
  name = "lb-static-ip"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_url_map
# Resource: global URL Map
resource "google_compute_url_map" "lb" {
  name            = "lb-url-map"
  default_service = google_compute_backend_service.lb.self_link
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_http_proxy
# Resource: global HTTP Proxy
resource "google_compute_target_http_proxy" "lb" {
  name    = "lb-http-proxy"
  url_map = google_compute_url_map.lb.self_link
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule
# Resource: global Forwarding Rule
resource "google_compute_global_forwarding_rule" "lb" {
  name                  = "lb-forwarding-rule"
  target                = google_compute_target_http_proxy.lb.self_link
  port_range            = "80"
  ip_protocol           = "TCP"
  ip_address            = google_compute_global_address.lb.address
  load_balancing_scheme = "EXTERNAL_MANAGED" # Current Gen LB (not classic)

}

