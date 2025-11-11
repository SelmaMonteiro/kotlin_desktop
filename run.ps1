Param(
    [switch]$VerboseInfo
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Caminho do JDK 21 (Temurin) instalado
$jdk21 = 'C:\Program Files\Eclipse Adoptium\jdk-21.0.9.10-hotspot'

if (!(Test-Path $jdk21)) {
    Write-Host "[ERRO] JDK 21 não encontrado em: $jdk21" -ForegroundColor Red
    Write-Host "Instale Eclipse Temurin 21 ou ajuste o caminho no run.ps1." -ForegroundColor Yellow
    exit 1
}

# Força Gradle a usar JDK 21 nesta sessão
$env:JAVA_HOME = $jdk21
$env:Path = "$jdk21\bin;" + $env:Path

if ($VerboseInfo) {
    Write-Host "JAVA_HOME: $env:JAVA_HOME" -ForegroundColor Cyan
}

# Confere a JVM usada pelo Gradle
Write-Host "[INFO] Verificando Gradle JVM..." -ForegroundColor Green
& .\gradlew.bat -v | Out-Host

# Executa a aplicação
Write-Host "[INFO] Iniciando aplicação..." -ForegroundColor Green
& .\gradlew.bat run | Out-Host

Write-Host "[OK] Execução finalizada." -ForegroundColor Green