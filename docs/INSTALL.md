# How to Install — Tribe Rush

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows, macOS or Linux)
- 2 GB free RAM, ~1 GB disk space
- Ports `8080` (game) and `3306` (MySQL, optional) free

No PHP, Apache, XAMPP or local MySQL needed.

## Option A — Windows (one click)

1. Install and start Docker Desktop.
2. Download/clone this repository.
3. Double-click **`TribeRush.bat`**.
4. Your browser opens at **http://localhost:8080** — register an account and play.
5. To stop the servers: `TribeRush_Durdur.bat`.
6. To wipe the world and start over: `TribeRush_Sifirla.bat` (asks for confirmation).

## Option B — macOS / Linux / manual

```bash
git clone <your-repo-url> tribe-rush
cd tribe-rush
chmod +x launch.sh
./launch.sh
```

What `launch.sh` does:

```bash
docker compose up -d --build --force-recreate
sleep 10
docker compose exec -T mysql bash /usr/src/tribalwars-scripts/initdb.sh
docker compose exec -T app php /usr/src/tribalwars/tribalwars/wereld1/daemons/bots.php
```

Then open http://localhost:8080.

## Admin setup (recommended)

1. Register your account in the game first.
2. Edit `app/tribalwars/wereld1/include/config.php`:
   - set `$config['admin_users'] = array("your-username");`
   - change `$config['master_pw']` to a secret password.
3. Rebuild: `docker compose up -d --build`.
4. In-game you will now see **GOD MODE** and **ADMIN** links. The admin panel also asks for the master password.

## Language

Default is **English**. Switch to Turkish any time: Settings (gear icon) → My account → Language → Türkçe → save.

## Troubleshooting

| Problem | Fix |
|---|---|
| `localhost:8080` doesn't load | Make sure Docker Desktop is running, wait ~30 s after start, then refresh |
| Port 8080 in use | Change `8080:80` in `docker-compose.yml` to another port and rebuild |
| World behaves oddly after update | Run the reset script (`TribeRush_Sifirla.bat`) for a clean world |
| Bots are idle | They develop/attack about once a minute via cron; add more from Admin → Bots |
| Game feels slow with 1000+ bots | Reduce bots to 100–300 from Admin → Bots → "Reduce" |

## Uninstall

```bash
docker compose down -v   # containers AND database volume are removed
```
