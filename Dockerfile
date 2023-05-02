FROM mcr.microsoft.com/windows/server:ltsc2022

# everything will be installed inside this directory inside the container
WORKDIR "C:/ProgramData"

# install chocolately package manager
RUN @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" -Y

RUN choco install openjdk11 -Y
RUN refreshenv; \
    java -version
#RUN where java
#ENV JAVA_HOME  C:\Program Files\Eclipse Adoptium\jre-11.0.19.7-hotspotRUN
#RUN echo $JAVA_HOME
#CMD ["java","-version"]

ENV TOMCAT_VERSION 10.1.0

# Download and install Tomcat
RUN powershell.exe -Command "(New-Object System.Net.WebClient).DownloadFile('https://downloads.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.zip', 'C:\\tomcat.zip');" \
    && powershell.exe -Command "Expand-Archive -Path 'C:\\tomcat.zip' -DestinationPath 'C:\\' -Force" \
    && powershell.exe -Command "Rename-Item -Path 'C:\\apache-tomcat-10.1.8' -NewName 'C:\\tomcat'"


COPY start-tomcat.ps1 .

# Expose port 8080
EXPOSE 8080

# Start Tomcat
ENTRYPOINT ["powershell.exe", "-ExecutionPolicy", "Bypass", "-File", "start-tomcat.ps1"]

