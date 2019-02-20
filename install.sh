#! /usr/bin/env bash
# author mettajs

log() {
    echo "o $1 --------------------------------------------"
}


# init centos7


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

run_frp() {
    mkdir /var/frp && mkdir /var/frp/conf &&cd /var/frp/conf
    wget https://frp.anys.ga/frps.ini
    sudo docker run --name frps -d -v /var/frp/conf:/var/frp/conf -p 5000-5100:5000-5100 -p 7000:7000 -p 7500:7500 -p 7001:7001 -p 8089:80 -p 8443:443 ruiny/frps
}


boot() {
    yum update -y
    install_utils
    install_docker
    install_docker_composer
    run_frp
}

boot
