# ⚖️ Law Office Infrastructure - DevOps Project

This project provides a complete, production-ready, self-hosted infrastructure stack for a small law office.  
It includes file sharing, remote access, backups, observability, and service automation — all built using modern DevOps tools and practices.

---

## 🚀 Project Overview

| Component        | Purpose                                          |
|------------------|--------------------------------------------------|
| *SMB Server*     | Secure file sharing within the office            |
| *Backup Server*  | Scheduled and versioned backups                  |
| *Remote Access*  | Tailscale-based secure remote entry              |
| *Observability*  | Full metrics + logs + alerting                   |
| *Automation*     | Infrastructure as Code using Terraform & Ansible |

---

## 🧰 Tech Stack

- *Hypervisor*: Proxmox VE
- *VM Provisioning*: Terraform
- *Configuration Management*: Ansible (Role-based)
- *Container Management*: Docker & Docker Compose
- *Remote Access*: Tailscale
- *Monitoring & Logs*:
  - Prometheus
  - Grafana
  - Loki + Docker Log Driver
  - Promtail
- *Security*:
  - SSH Hardened
  - AdGuard Home for DNS Filtering
- *CI/CD*: GitHub Actions for service updates & deployments

---

## 🗂️ Infrastructure Diagram
```bash
[Proxmox Node]
├── Remote VM
│   ├── AdGuard Home (DNS Sinkhole)
|   |── RustDesk
├── SMB Server (Internal File Sharing)
├── Backup Server (Automated Backups + Snapshots)
|── Mointer Server (Grafana, Loki, Alertmanger, Prometheus)
---
```
## 📡 Monitoring & Observability

- *Grafana Dashboards* with live metrics for:
  - CPU, RAM, Disk usage
  - Network activity
  - Container health
- *Prometheus Alerts*: Email/Discord notifications on high usage or downtime
- *Loki + Promtail + Docker Logging*: Real-time logs from all services with error alerting

---

## 🔐 Security Highlights

- Tailscale VPN limits exposure to the internet
- AdGuard Home filters DNS for all internal clients
- Firewalls and minimal service exposure are enforced by design

---

## 📦 Backups

- Incremental, versioned backups of critical data
- Snapshots enabled on both:
  - SMB file shares
  - Configuration & Service volumes
- Backup verification alerts are integrated with monitoring

---

## 📄 Project Structure

```bash
infrastructure/
├── terraform/
│   ├── main.tf         # VM provisioning on Proxmox
│   └── provider.tf
│   └── terraform.tf
├── ansible/
│   ├── inventory/
│   ├── playbooks/
│   └── roles/
│       ├── docker_config/
│       ├── docker_setup/
│       ├── docker_apps/
│       └── ...
.github/
└── workflows/
    └── deploy.yml      # CI/CD Pipeline
```

## ⚙️ Usage

## 🚀 Deploy Infrastructure
``` bash
cd infrastructure/terraform
terraform init && terraform apply
```
⚙️ Configure & Install Services
``` bash
cd ../ansible
ansible-playbook -i inventory/hosts site.yml
```

## 🔁 CI/CD (via GitHub Actions)
``` bash
•	Push to main → Triggers Docker service update on the remote VM
```

## 📈 Dashboards

All Grafana dashboards are stored as JSON and auto-provisioned on boot.
Example panels:
•	Container status
•	Docker logs via Loki
•	Backup task history
•	AdGuard DNS analytics


## 🤝 Author

Rami Dannah
DevOps Engineer | Self-hosting Enthusiast | Infrastructure-as-Code Advocate
📍 Currently based in Saudi Arabia
🌐 LinkedIn | GitHub



## 🧠 Notes
•	Built with stability, cost-efficiency, and future extensibility in mind.
•	All services are containerized for easier management and updates.
•	Fully documented and portable across other small-business use cases.