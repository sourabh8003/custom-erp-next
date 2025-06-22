@echo off
title Step 1 - Complete System Shutdown
color 0C
echo.
echo ===============================================
echo    STEP 1: COMPLETE SYSTEM SHUTDOWN
echo ===============================================
echo.

echo WARNING: This will stop all services and clear all data!
echo Only run this to prepare for disaster recovery!
echo.
set /p "confirm=Are you sure you want to continue? (Y/N): "
if /i "%confirm%" NEQ "Y" (
    echo Operation cancelled.
    goto :end
)

echo.
echo Starting complete shutdown and cleanup...

echo Step 1: Stopping all Docker services...
docker-compose -f pwd.yml down -v --remove-orphans

echo Step 2: Removing any remaining volumes...
docker volume rm frappe_docker_sites frappe_docker_logs frappe_docker_redis-queue-data 2>nul

echo Step 3: Clearing database directory...
if exist "D:\docker-data\mariadb" (
    rmdir /s /q "D:\docker-data\mariadb"
    echo Database directory cleared.
) else (
    echo Database directory already clean.
)

echo Step 4: Creating fresh database directory...
mkdir "D:\docker-data\mariadb" 2>nul

echo Step 5: Verifying cleanup...
docker volume ls | findstr frappe_docker
if %ERRORLEVEL% EQU 0 (
    echo WARNING: Some volumes still exist
) else (
    echo ✓ All Docker volumes cleared
)

dir "D:\docker-data\mariadb" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✓ Database directory is clean
) else (
    echo ✓ Database directory recreated
)

echo.
echo ✓ Step 1 completed successfully!
echo System is ready for disaster recovery.
color 0A

:end
echo.
echo Press any key to continue to Step 2...
pause >nul