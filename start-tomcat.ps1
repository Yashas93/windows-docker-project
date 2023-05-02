# Set the environment variables for Tomcat
$env:CATALINA_HOME = "C:\tomcat"


# Start Tomcat on the default port (8080)
& "$env:CATALINA_HOME\bin\catalina.bat" run
