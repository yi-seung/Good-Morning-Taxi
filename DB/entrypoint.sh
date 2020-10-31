#!/bin/bash

if [ -z $MYSQL_ROOT_PASSWORD ]; then
  exit 1
fi

mysql_install_db --user mysql > /dev/null

cat > /tmp/sql <<EOF
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("$MYSQL_ROOT_PASSWORD") WHERE user='root';
CREATE DATABASE management default CHARACTER SET UTF8;
USE management;
CREATE TABLE CUSTOMER ( id INT PRIMARY KEY AUTO_INCREMENT, image VARCHAR(1024), name VARCHAR(64), email VARCHAR(64), text VARCHAR(1024), coin VARCHAR(64), createdData DATETIME, isDeleted INT) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
COMMIT;
INSERT INTO CUSTOMER VALUES (1, 'https://placeimg.com/500/150/1', 'samsung', 'ad@samsung.com', 'The best employer in the world', '10000', NOW() ,0);
INSERT INTO CUSTOMER VALUES (2, 'https://placeimg.com/500/150/2', 'nike', 'ad@nike.com', 'Just Do It', '1000', NOW(),0);
EOF

mysqld --bootstrap --verbose=0 < /tmp/sql
rm -rf /tmp/sql

mysqld
