#!/bin/sh
# Presses "Create Database" on the setup page (index.php) once Apache and the database answer, so
# the lab starts ready. Skipped when the users table already exists, so a restart keeps the
# database as the player left it.
users_table() {
  php -r '$c=@new mysqli("db","root","","1ccb8097d0e9ce9f154608be60224c7c"); exit(!$c->connect_errno && $c->query("SELECT 1 FROM users LIMIT 1") ? 0 : 1);' 2>/dev/null
}
for i in $(seq 1 150); do
  if users_table; then echo "vwa-setup-db: database ready"; exit 0; fi
  curl -fsS -o /dev/null --data "submit=Enter" http://127.0.0.1/index.php 2>/dev/null
  sleep 2
done
echo "vwa-setup-db: database setup failed"; exit 1
