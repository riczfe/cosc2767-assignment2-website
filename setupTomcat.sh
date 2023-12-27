cp ./cosc2767-assignment2-website/Dockerfile_tomcat Dockerfile
docker build -t my-custom-tomcat-image .
docker run -d -p 8081:8080 my-custom-tomcat-image