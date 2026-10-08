# Upstream

| | |
| --- | --- |
| Project | OWASP Vulnerable Web Application |
| Repository | https://github.com/OWASP/Vulnerable-Web-Application |
| Version | master (no releases; README says 1.0.0) |
| Commit | c0f2689f4adc3dab4e310a4c709bbee9386c6b02 |
| Licence | GPL-3.0 |

`build/web/app/` is that commit, unchanged, without its Git history. Upstream has no Dockerfile:
`build/web/Dockerfile` follows its installation guide (files in `/var/www/html`,
`allow_url_include` and `allow_url_fopen` on) on `php:7.4-apache`, changes the hardcoded database
host `localhost` to `db` in the copied `index.php` and `SQL/*.php`, and runs `setup-db.sh` in the
background at start, which presses "Create Database" once. `build/db/Dockerfile` is MariaDB 10.11
allowing root with no password, as XAMPP. To update, replace `build/web/app/` with a newer
commit, then change this table.
