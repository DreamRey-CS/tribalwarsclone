#!/bin/bash
set -e

for i in $(seq 1 30); do
  mysqladmin -h 127.0.0.1 -u root -pmy-secret-pw ping --silent && break
  sleep 2
done
mysql -h 127.0.0.1 -u root -pmy-secret-pw -e "CREATE DATABASE IF NOT EXISTS pkmhunters_imp; CREATE DATABASE IF NOT EXISTS pkmhunters_world;"
# --force makes this safe after an interrupted first boot: existing rows/tables
# are skipped while missing tables later in the dump are still created.
mysql --force -h 127.0.0.1 -u root -pmy-secret-pw < /usr/src/tribalwars/db_templates/tribalwars_main.sql
mysql --force -h 127.0.0.1 -u root -pmy-secret-pw < /usr/src/tribalwars/db_templates/tribalwars_world.sql
mysql -h 127.0.0.1 -u root -pmy-secret-pw pkmhunters_imp -e "INSERT INTO configs (ip,style,lang,support_lang) SELECT '127.0.0.1','','TR','TR' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM configs WHERE ip='127.0.0.1'); INSERT INTO configs (ip,style,lang,support_lang) SELECT '172.18.0.1','','TR','TR' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM configs WHERE ip='172.18.0.1'); UPDATE configs SET lang='TR', support_lang='TR';"
mysql -h 127.0.0.1 -u root -pmy-secret-pw pkmhunters_imp -e "UPDATE users SET administration=1;"
mysql -h 127.0.0.1 -u root -pmy-secret-pw pkmhunters_world -e "INSERT INTO unit_place (villages_from_id,villages_to_id) SELECT v.id,v.id FROM villages v LEFT JOIN unit_place p ON p.villages_from_id=v.id AND p.villages_to_id=v.id WHERE p.villages_from_id IS NULL;"
mysql -h 127.0.0.1 -u root -pmy-secret-pw pkmhunters_world -e "CREATE TABLE IF NOT EXISTS premium_auto (userid INT NOT NULL, villageid INT NOT NULL, auto_recruit TINYINT NOT NULL DEFAULT 0, targets TEXT, auto_farm TINYINT NOT NULL DEFAULT 0, last_recruit INT NOT NULL DEFAULT 0, last_farm INT NOT NULL DEFAULT 0, PRIMARY KEY (userid, villageid));"

# exec "$@"
