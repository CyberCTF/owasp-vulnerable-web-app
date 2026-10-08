#!/bin/sh
# SQL injection level 1 answers John's last name from the database (created at start).
set -e
out=$(curl -fsS --data "firstname=John&submit=Submit" http://web/SQL/sql1.php)
echo "$out" | grep -q "Doe"
