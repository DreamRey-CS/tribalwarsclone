# Tribe Rush

A self-hosted, Docker-based Tribal Wars style browser game (English default, Turkish optional). No XAMPP/Apache/MySQL installation needed — PHP/Apache and MySQL run in the supplied containers.

Original files credit: DSLAN / TribalWars LAN open-source release. All game IP belongs to its respective owners (InnoGames / Tribal Wars).

reference https://gitlab.com/tribalwars/tribalwars

## Features

- **One-click start** on Windows (`TribeRush.bat`) or any OS with Docker (`launch.sh`)
- **Two languages:** English (default) and Turkish, switchable in-game via Settings → Account
- **Local bots:** CPU opponents that grow villages and attack automatically; add/remove thousands from the admin panel
- **Fast PvP world:** ~3x production, construction and troop speed; 15-minute beginner protection
- **Premium system:** research-all, halve construction time, up to 30x30 map, automatic troop recruitment, farm assistant
- **Admin panel:** password protected, manage players, villages, bots, messages, announcements, world reset
- **God Mode (admin only):** instant resources, buildings, technologies and troops

Full install guide: [`docs/INSTALL.md`](docs/INSTALL.md).

## Quick start

```bash
git clone https://github.com/DreamRey-CS/tribalwarsclone tribe-rush
cd tribe-rush
./launch.sh
```

Then open http://localhost:8080 and register an account.

On Windows, just double-click `TribeRush.bat` (Docker Desktop must be running).

## First steps after install

1. Register the admin account (first account, e.g. `sinan`).
2. Put your username into `admin_users` in `app/tribalwars/wereld1/include/config.php` and change `master_pw` in the same file, then rebuild (`docker compose up -d --build`).
3. Open the in-game **GOD MODE** link to max out your village, or manage everything from **ADMIN**.
4. Add bots from Admin → Bots if you want more opponents.

## Repository layout

| Path | What |
|---|---|
| `app/` | Game source (PHP/Smarty templates) |
| `persistent/db_templates/` | Fresh database dumps used on first boot |
| `scripts/` | DB init (`initdb.sh`) and cron setup (`initcron.sh`) |
| `docker-compose.yml`, `Dockerfile`, `Dockerfile_db` | Containers |
| `TribeRush*.bat`, `launch.sh` | Start/stop/reset helpers |
| `docs/INSTALL.md` | Detailed install instructions |

## Notes

- The MySQL data lives in a Docker volume on your machine; it is **not** part of this repository, so every fresh clone starts with a clean world.
- Default credentials inside containers are for local use only (`root` / `my-secret-pw`). Change them if you expose the server.
- See in-game Help for rules and mechanics.
