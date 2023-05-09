# Set the environment variables for Tomcat and Java
$env:CATALINA_HOME = "C:\tomcat"
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-11.0.19.7-hotspot\"

#setting JDK 
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-11.0.19.7-hotspot\"


# Start Tomcat on the default port (8080)
& "$env:CATALINA_HOME\bin\catalina.bat" run
