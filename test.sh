#! /usr/bin/env bash





init() {
    bash ./install.sh
    hash docker
    hash git
    hash wget
    hash curl
}


init || exit 1
