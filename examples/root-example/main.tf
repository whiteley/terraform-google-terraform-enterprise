provider "google" {
  region  = "${var.region}"
  project = "${var.project}"
}

provider "google-beta" {
  region  = "${var.region}"
  project = "${var.project}"
}

module "tfe-cluster" {
  source           = "hashicorp/terraform-enterprise/google"
  version          = "0.1.0"
  credentials_file = "auth-file-123456678.json"
  region           = "${var.region}"
  zone             = "${var.region}-a"
  project          = "${var.project}"
  domain           = "example.com"
  dns_zone         = "example"
  public_ip        = "1.2.3.4"
  certificate      = "https://www.googleapis.com/compute/v1/project/terraform-test/global/sslCertificates/tfe"
  ssl_policy       = "tfe-ssl-policy"
  subnet           = "tfe-subnet"
  frontend_dns     = "tfe-cluster"

  primary_count   = "3"
  secondary_count = "2"

  license_file = "customer.rli"
}
