# OWASP Vulnerable Web Application

[Vulnerable Web Application](https://github.com/OWASP/Vulnerable-Web-Application) by OWASP: a
simple PHP/MySQL website for learning web penetration testing, with leveled exercises in five
categories: Command Execution, File Inclusion, File Upload, SQL and XSS. This repository runs it
with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, and
the upstream source in [`build/web/app/`](build/web/app) is served by a PHP 7.4 / Apache image
written for it (upstream ships no Dockerfile), with the database created at first start.

| Machine | Service |
| --- | --- |
| web | Vulnerable Web Application (PHP 7.4, Apache) on port 80, published on 8027 |
| db | MariaDB 10.11 on port 3306 |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:8027/homepage.html. The database is already created; `index.php`
resets it. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the
[project README](https://github.com/OWASP/Vulnerable-Web-Application#readme).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

GPL-3.0, as Vulnerable Web Application ([LICENSE](LICENSE)). This application is deliberately
vulnerable: keep it isolated.
