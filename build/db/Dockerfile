# The MySQL of the XAMPP setup the application expects, as MariaDB 10.11: it connects as root with
# an empty password and creates its database itself (setup page), so root may log in from the
# network with no password.
FROM docker.io/library/mariadb:10.11
ENV MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1
