provider "proxmox" {
  pm_api_url      = "ip_address:8006/api2/json"
  pm_user         = "user@pam"
  pm_password     = "password"
  pm_tls_insecure = true
}
