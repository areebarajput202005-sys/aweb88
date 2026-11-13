@echo off
title Shoe Volt Website Local Server
echo ====================================================
echo Starting Shoe Volt Local Web Server...
echo URL: http://localhost:3000/
echo Contact Page: http://localhost:3000/contact.html
echo Press Ctrl+C to stop the server.
echo ====================================================
powershell -ExecutionPolicy Bypass -File "%~dp0server.ps1"
pause
