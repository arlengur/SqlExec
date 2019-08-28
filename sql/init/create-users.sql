/* user is created automatically by the following command: */
GRANT ALL PRIVILEGES ON * . * TO '${hibernate.connection.username}' IDENTIFIED BY '${hibernate.connection.password}';
GRANT ALL PRIVILEGES ON * . * TO 'statsadmin' IDENTIFIED BY '${hibernate.connection.password}';
GRANT ALL PRIVILEGES ON * . * TO 'gsnuser' IDENTIFIED BY '${hibernate.connection.password}';
FLUSH PRIVILEGES;