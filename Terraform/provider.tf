provider "proxmox" {
  pm_api_url      = "https://192.168.8.250:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "R@mi-no0"
  pm_tls_insecure = true
}
