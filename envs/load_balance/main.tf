resource "google_compute_global_address" "lb_ip" {
  name = "load-balancer-ip"  
}

resource "google_compute_health_check" "lb_health_check" {
  name               = "lb-health-check"
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

 tcp_health_check {
    port = 5000
 }
  
}

resource "google_compute_instance_group" "lb_instance_group" {
  name        = "lb-instance-group"
  zone       = "us-central1-a"
  instances  = [var.instance_deet]

  named_port {
    name = "http"
    port = 5000
  }
}

resource "google_compute_backend_service" "lb_backend_service" {
  name                = "lb-backend-service"
  protocol            = "HTTP"
  port_name           = "http"
  load_balancing_scheme = "EXTERNAL"
  health_checks       = [google_compute_health_check.lb_health_check.id]

  backend {
    group = google_compute_instance_group.lb_instance_group.id
  }
}

resource "google_compute_url_map" "lb_url_map" {
  name            = "lb-url-map"
  default_service = google_compute_backend_service.lb_backend_service.id
}

resource "google_compute_target_http_proxy" "lb_http_proxy" {
  name    = "lb-http-proxy"
  url_map = google_compute_url_map.lb_url_map.id
}

resource "google_compute_global_forwarding_rule" "lb_forwarding_rule" {
  name   = "lb-forwarding-rule"
  ip_address   = google_compute_global_address.lb_ip.address
  ip_protocol     = "TCP"
  port_range    = "80"
  target   = google_compute_target_http_proxy.lb_http_proxy.id
  load_balancing_scheme = "EXTERNAL"
}