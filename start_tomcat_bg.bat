@echo off
set "CATALINA_HOME=C:\Users\ASUS\Downloads\apache-tomcat-9.0.113-windows-x64\apache-tomcat-9.0.113"
set "JAVA_HOME=E:\jdk21"
REM Try to find true JAVA_HOME if possible, but CATALINA_HOME is most important.
cd /d "%CATALINA_HOME%\bin"
echo Starting Tomcat...
start "" /b catalina.bat run > "d:\web实训\movie-management-system\tomcat_run.log" 2>&1
echo Tomcat started in background.
