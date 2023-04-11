#/bin/bash

function deleteArgument {
    sudo rm -rf $1
}

function checkAndInstallDocker {
    sudo docker --help 2>/dev/null  1> check.tmp
    if ! [[ $(cat check.tmp | grep "A self-sufficient runtime for containers") ]]; then
        # Delete all docker files from the space of a user
        sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin
        sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin
        sudo rm -rf /var/lib/docker /etc/docker 2>/dev/null
        sudo rm /etc/apparmor.d/docker 2>/dev/null
        sudo groupdel docker 2>/dev/null
        sudo rm -rf /var/run/docker.sock 2>/dev/null
        # Install all necessary utilities for Docker
        sudo apt-get update
        sudo apt-get install ca-certificates curl gnupg lsb-release
        sudo mkdir -m 0755 -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        # Install Docker
        sleep 5
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        sleep 5
        sudo docker run hello-world 1> check.tmp
        if [[ ! $(cat check.tmp | grep "Hello from Docker!") ]]; then
            echo "\n\nSomething was wrong. Try again.\n\n"
            exit
        else
            printf "\n\n\nDocker is running\n\n\n"
            docker rmi -f hello-world:latest
        fi
    else
        printf "\n\n\nDocker is running\n\n\n"
    fi
    deleteArgument check.tmp
}

checkAndInstallDocker
