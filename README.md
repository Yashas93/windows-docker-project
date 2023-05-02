to build docker image:

docker build -t windows-tomcat:2022 . 


to run the container : 
docker run -d -p 8080:8080 windows-tomcat:2022 . 
