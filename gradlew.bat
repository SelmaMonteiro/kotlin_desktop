@echo off
REM Gradle wrapper launcher for Windows (uses JAVA_HOME if set)
SETLOCAL

set "APP_HOME=%~dp0"
set "APP_BASE_NAME=%~n0"

REM Default JVM options (match POSIX script)
set "DEFAULT_JVM_OPTS=-Dfile.encoding=UTF-8 -Xmx64m -Xms64m"

REM Determine Java executable
set "JAVA_EXE="

REM Try to read org.gradle.java.home from gradle.properties (project-local override)
set "GRADLE_JAVA_HOME="
if exist "%APP_HOME%gradle.properties" (
  for /f "usebackq tokens=1,* delims==" %%A in ("%APP_HOME%gradle.properties") do (
    if /I "%%A"=="org.gradle.java.home" set "GRADLE_JAVA_HOME=%%B"
  )
)

if not "%GRADLE_JAVA_HOME%"=="" set "JAVA_EXE=%GRADLE_JAVA_HOME%\bin\java.exe"
if "%JAVA_EXE%"=="" if not "%JAVA_HOME%"=="" set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
if "%JAVA_EXE%"=="" set "JAVA_EXE=java"

REM Launch Gradle Wrapper
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% -Dorg.gradle.appname=%APP_BASE_NAME% -jar "%APP_HOME%gradle\wrapper\gradle-wrapper.jar" %*

exit /b %ERRORLEVEL%