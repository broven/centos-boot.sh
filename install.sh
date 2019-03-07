#! /usr/bin/env bash
# author mettajs

log() {
    echo "o $1 --------------------------------------------"
}


# init centos7
install_bt() {
    wget -O install.sh http://download.bt.cn/install/install_6.0.sh && bash install.sh
    echo "Will disable the firewall for fuck sake"
    systemctl disable firewalld
    systemctl stop firewalld
    systemctl status firewalld
}


install_utils() {
    yum install -y git curl wget;
}

install_docker() {
    log "install docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
     sudo systemctl enable docker.service
    sudo systemctl start docker.service
}

install_docker_composer() {
    sudo yum install epel-release -y
    sudo yum install -y python-pip
    sudo pip install docker-compose
}


boot() {
    yum update -y
    install_utils
    install_docker
    install_docker_composer
    install_bt
}

boot
