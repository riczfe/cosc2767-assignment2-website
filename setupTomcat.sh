cp ./cosc2767-assignment2-website/Dockerfile_tomcat Dockerfile
docker build -t my-tomcat-image .
docker run -d --name tomcat-container -p 8080:8080 my-tomcat-image
useradd dockeradmin
passwd dockeradmin
usermod -aG docker dockeradmin
sleep 2
mv ./cosc2767-assignment2-website/sshd_config /etc/ssh/sshd_config
service sshd reload