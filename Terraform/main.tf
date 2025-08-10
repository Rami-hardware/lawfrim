
resource "proxmox_vm_qemu" "remote-server" {
  name        = "remote-server"
  target_node = "lawfirm"
  clone       = "ubuntu-2004-cloudinit-template"
  full_clone  = false
  agent       = 1
  os_type     = "cloud-init"
  vmid        = 911

  ciuser     = "user"
  cipassword = "password"
  ipconfig0  = "ip=ipAddr/24,gw=gateway"

  scsihw  = "virtio-scsi-pci"
  cores   = 1
  sockets = 1
  memory  = 1024

  bios    = "ovmf"
  machine = "q35"

  # Cloud-init disk (for cloud-init config only)
  disk {
    type    = "cloudinit"
    storage = "local-lvm"
    size    = "5G"
    slot    = "ide2"
  }

  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "local-lvm"
    size    = "25G"
    slot    = "scsi0"
  }


  # Network
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # SSH key
  sshkeys = file("~/.ssh/id_rsa.pub")

  # Serial port
  serial {
    id   = 0
    type = "socket"
  }

  # Lifecycle ignore disk resize
  lifecycle {
    ignore_changes = [disk[0].size]
  }
}

resource "proxmox_vm_qemu" "smb-server" {
  name        = "smb-server"
  target_node = "lawfirm"
  clone       = "ubuntu-2004-cloudinit-template"
  full_clone  = false
  agent       = 1
  os_type     = "cloud-init"
  vmid        = 115

  ciuser     = "user"
  cipassword = "password"
  ipconfig0  = "ip=ipAddr/24,gw=gateway"

  scsihw  = "virtio-scsi-pci"
  cores   = 1
  sockets = 1
  memory  = 6144

  bios    = "ovmf"
  machine = "q35"

  # Cloud-init disk (for cloud-init config only)
  disk {
    type    = "cloudinit"
    storage = "local-lvm"
    size    = "5G"
    slot    = "ide2"
  }

  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "local-lvm"
    size    = "25G"
    slot    = "scsi0"
  }


  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "shared"
    size    = "1970G"
    slot    = "scsi1"
  }

  # Network
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # SSH key
  sshkeys = file("~/.ssh/id_rsa.pub")

  # Serial port
  serial {
    id   = 0
    type = "socket"
  }

  # Lifecycle ignore disk resize
  lifecycle {
    ignore_changes = [disk[0].size]
  }
}


resource "proxmox_vm_qemu" "monitor-server" {
  name        = "monitor-server"
  target_node = "lawfirm"
  clone       = "ubuntu-2004-cloudinit-template"
  full_clone  = false
  agent       = 1
  os_type     = "cloud-init"
  vmid        = 222

  ciuser     = "user"
  cipassword = "password"
  ipconfig0  = "ip=ipAddr/24,gw=gateway"

  scsihw  = "virtio-scsi-pci"
  cores   = 1
  sockets = 1
  memory  = 2048

  bios    = "ovmf"
  machine = "q35"

  # Cloud-init disk (for cloud-init config only)
  disk {
    type    = "cloudinit"
    storage = "local-lvm"
    size    = "5G"
    slot    = "ide2"
  }

  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "local-lvm"
    size    = "25G"
    slot    = "scsi0"
  }


  # Network
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # SSH key
  sshkeys = file("~/.ssh/id_rsa.pub")

  # Serial port
  serial {
    id   = 0
    type = "socket"
  }

  # Lifecycle ignore disk resize
  lifecycle {
    ignore_changes = [disk[0].size]
  }
}


resource "proxmox_vm_qemu" "backup-server" {
  name        = "backup-server"
  target_node = "lawfirm"
  clone       = "ubuntu-2004-cloudinit-template"
  full_clone  = false
  agent       = 1
  os_type     = "cloud-init"
  vmid        = 323

  ciuser     = "user"
  cipassword = "password"
  ipconfig0  = "ip=ipAddr/24,gw=gateway"

  scsihw  = "virtio-scsi-pci"
  cores   = 1
  sockets = 1
  memory  = 4096

  bios    = "ovmf"
  machine = "q35"

  # Cloud-init disk (for cloud-init config only)
  disk {
    type    = "cloudinit"
    storage = "local-lvm"
    size    = "5G"
    slot    = "ide2"
  }

  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "local-lvm"
    size    = "25G"
    slot    = "scsi0"
  }


  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "backup"
    size    = "1970G"
    slot    = "scsi1"
  }

  # OS and apps disk (20G on local-lvm)
  disk {
    type    = "disk"
    storage = "shared"
    size    = "1970G"
    slot    = "scsi2"
  }

  # Network
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # SSH key
  sshkeys = file("~/.ssh/id_rsa.pub")

  # Serial port
  serial {
    id   = 0
    type = "socket"
  }

  # Lifecycle ignore disk resize
  lifecycle {
    ignore_changes = [disk[0].size]
  }
}
