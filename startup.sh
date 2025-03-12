#!/bin/bash

echo "CI/CD services script..."

check_port() {
    if lsof -i:8080 &>/dev/null; then
        echo "Port 8080 is in use by another process. Please free the port and try again."
        exit 1
    fi
}

case "$1" in
    start)
        echo "Starting CI/CD services..."
        check_port
        sleep 1
        sudo systemctl enable jenkins
        sudo systemctl enable sonarqube
        sudo systemctl start jenkins && sudo systemctl start sonarqube
        ;;
    stop)
        echo "Stopping CI/CD services..."
        sleep 1
        sudo systemctl stop jenkins && sudo systemctl stop sonarqube
        sudo systemctl disable jenkins
        sudo systemctl disable sonarqube
        ;;
    status)
        echo "Jenkins status:"
        echo -n "Enabled: "
        echo "$(sudo systemctl is-enabled jenkins)"
        echo -n "Active: "
        echo "$(sudo systemctl is-active jenkins)"

        echo "SonarQube status:"
        echo -n "Enabled: "
        echo "$(sudo systemctl is-enabled sonarqube)"
        echo -n "Active: "
        echo "$(sudo systemctl is-active sonarqube)"
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac

exit 0
