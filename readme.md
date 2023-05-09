# Introduction:

This Dockerfile sets up a Windows Server 2022 container with Apache Tomcat 10.1.8 and OpenJDK 11 installed. It uses Chocolatey as a package manager to install OpenJDK and downloads the Tomcat binary distribution from the official Apache Tomcat website.

The container will expose port 8080 and start Tomcat using a PowerShell script start-tomcat.ps1.

## Pre-requsites: 

   - Windows flavour OS.
   - Docker

To use this Dockerfile, you can create a new directory and save the contents above as a Dockerfile. 
Then, in that directory, you can build the Docker image by running the command:

docker build -t windows22-tomcat10.1.8:v1 . 

        docker build -t windows22-tomcat10.1.8:v1 .


Once the build is complete, you can start a container using the image with the command:

        docker run -p 8080:8080 windows22-tomcat10.1.8:v1 

    This will start Tomcat and bind the container's port 8080 to the host's port 8080 so that you can access Tomcat by navigating to http://localhost:8080 in a web browser.



 git config --global user.email "yashas.v@outlook.com"
  git config --global user.name "Yashas V"



