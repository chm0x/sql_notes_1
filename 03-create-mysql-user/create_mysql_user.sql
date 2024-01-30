-- CREATE A MYSQL USER 

CREATE USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';

FLUSH PRIVILEGES;