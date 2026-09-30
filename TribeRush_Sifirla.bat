@echo off
setlocal
cd /d "%~dp0"
echo DIKKAT: Bu islem oyunculari, koyleri, botlari ve hareketleri sifirlar.
choice /M "Dunyayi sifirlamak istiyor musunuz"
if errorlevel 2 exit /b 0
where docker >nul 2>nul
if errorlevel 1 (
  echo Docker bulunamadi. Docker Desktop'i acin.
  pause
  exit /b 1
)
echo Konteynerler baslatiliyor...
docker compose up -d --build --force-recreate
if errorlevel 1 docker-compose up -d --build --force-recreate
timeout /t 10 /nobreak >nul
echo Veritabanlari siliniyor ve temiz kurulum yapiliyor...
docker compose exec -T mysql mysql -h 127.0.0.1 -u root -pmy-secret-pw -e "DROP DATABASE IF EXISTS pkmhunters_imp; DROP DATABASE IF EXISTS pkmhunters_world;"
if errorlevel 1 docker-compose exec -T mysql mysql -h 127.0.0.1 -u root -pmy-secret-pw -e "DROP DATABASE IF EXISTS pkmhunters_imp; DROP DATABASE IF EXISTS pkmhunters_world;"
docker compose exec -T mysql bash /usr/src/tribalwars-scripts/initdb.sh
if errorlevel 1 docker-compose exec -T mysql bash /usr/src/tribalwars-scripts/initdb.sh
docker compose exec -T app php /usr/src/tribalwars/tribalwars/wereld1/daemons/bots.php
echo Dunya sifirlandi.
start "Tribe Rush" http://localhost:8080
endlocal
