yum install docker -y 
service docker start
cp ./cosc2767-assignment2-website/Dockerfile_jenkins Dockerfile
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
tar -xvzf apache-maven-3.9.5-bin.tar.gz
mv apache-maven-3.9.5 maven
tar -xvzf apache-tomcat-9.0.83.tar.gz
mv apache-tomcat-9.0.83 tomcat
yum install jenkins -y
service jenkins start