resource "google_compute_instance" "petclinic_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"
    access_config {}  
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash

    # Install docker engine
    # Add Docker's official GPG key:
    sudo apt-get update -y
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    systemctl enable docker
    systemctl start docker

    # Setup run docker command without sudo
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker

    # Setup docker swarm
    docker swarm init --advertise-addr $(hostname -I | awk '{print $1}')
 
    EOF

  tags = var.tags
}
