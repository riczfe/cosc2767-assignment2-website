#!/bin/bash

# Install Docker
yum install docker -y
service docker start

# Copy the Dockerfile for Jenkins (adjust the path as needed)
cp ./cosc2767-assignment2-website/Dockerfile_jenkins Dockerfile

#Install Java
amazon-linux-extras install -y java-openjdk11

# Install Maven
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
tar -xvzf apache-maven-3.9.5-bin.tar.gz
mv apache-maven-3.9.5 maven

# Install Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
tar -xvzf apache-tomcat-9.0.83.tar.gz
mv apache-tomcat-9.0.83 tomcat

# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
yum install jenkins -y
service jenkins status

# Setup Maven Environment 
cat ./cosc2767-assignment2-website/bash_profile.txt | sudo tee /root/.bash_profile

# Display status
echo "Installation complete. Jenkins, Docker, Maven, and Tomcat have been installed and started."
