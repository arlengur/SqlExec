/* user is created automatically by the following command: */
CREATE USER IF NOT EXISTS `${hibernate.connection.username}` IDENTIFIED BY '${hibernate.connection.password}';
GRANT ALL PRIVILEGES ON *.* TO `${hibernate.connection.username}`;

CREATE USER IF NOT EXISTS `statsadmin` IDENTIFIED BY '${hibernate.connection.password}';
GRANT ALL PRIVILEGES ON *.* TO `statsadmin`;

CREATE USER IF NOT EXISTS `gsnuser` IDENTIFIED BY '${hibernate.connection.password}';
GRANT ALL PRIVILEGES ON *.* TO `gsnuser`;

FLUSH PRIVILEGES;