@echo off
setlocal
cd /d "%~dp0"
where docker >nul 2>nul
if errorlevel 1 (
  echo Docker bulunamadi. Docker Desktop'i acip tekrar deneyin.
  pause
  exit /b 1
)
echo Tribe Rush yerel sunucusu baslatiliyor...
docker compose up -d --build --force-recreate
if errorlevel 1 docker-compose up -d --build --force-recreate
if errorlevel 1 (
  echo Konteynerler baslatilamadi.
  pause
  exit /b 1
)
timeout /t 10 /nobreak >nul
echo Veritabani ve yerel botlar hazirlaniyor...
docker compose exec -T mysql bash /usr/src/tribalwars-scripts/initdb.sh
if errorlevel 1 docker-compose exec -T mysql bash /usr/src/tribalwars-scripts/initdb.sh
if errorlevel 1 (
  echo Veritabani kurulumu basarisiz. Yukaridaki hatayi kontrol edin.
  pause
  exit /b 1
)
echo Botlar ve birlik kayitlari hazirlaniyor...
docker compose exec -T app php /usr/src/tribalwars/tribalwars/wereld1/daemons/bots.php
start "Tribe Rush" http://localhost:8080
echo Oyun acildi: http://localhost:8080
endlocal
