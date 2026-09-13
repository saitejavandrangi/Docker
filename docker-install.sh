# 1. Update package index
sudo apt update

# 2. Install required packages for HTTPS and certificates
sudo apt install ca-certificates curl -y

# 3. Create a directory for Docker's GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# 4. Download Docker’s official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# 5. Make the key readable by all users
sudo chmod a+r /etc/apt/keyrings/docker.asc

# 6. Add Docker repository to Apt sources
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# 7. Update package index again (now includes Docker repo)
sudo apt update

# 8. Install Docker engine, CLI, container runtime, and plugins
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# 9. Start Docker service
sudo systemctl start docker

# 10. Check Docker service status
sudo systemctl status docker

# 11. Run a test container to confirm installation
sudo docker run hello-world

