#using micorsoft server:2022 as baseimage
FROM mcr.microsoft.com/windows/server:ltsc2022

#maintainer 
MAINTAINER "YashasV"

# everything will be installed inside this directory inside the container
WORKDIR "C:/ProgramData"

# install chocolately package manager
RUN @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" -Y

#install jdk11
RUN choco install openjdk11 -Y
RUN refreshenv; \
    powershell.exe -Command $env:JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-11.0.19.7-hotspot\"

# Download and install Tomcat
RUN powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://downloads.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.zip', 'C:\\tomcat.zip');" \
    && powershell.exe -Command "Expand-Archive -Path 'C:\\tomcat.zip' -DestinationPath 'C:\\' -Force" \
    && powershell.exe -Command "Rename-Item -Path 'C:\\apache-tomcat-10.1.8' -NewName 'C:\\tomcat'"

#copy startup script of tomcat
COPY start-tomcat.ps1 .

# Expose port 8080
EXPOSE 8080

# Start Tomcat
ENTRYPOINT ["powershell.exe", "-ExecutionPolicy", "Bypass", "-File", "start-tomcat.ps1"]

