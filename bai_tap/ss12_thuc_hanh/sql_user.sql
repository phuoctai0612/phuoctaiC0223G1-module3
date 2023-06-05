CREATE DATABASE users_1;
USE users_1;

create table users_1 (
 id int NOT NULL primary key AUTO_INCREMENT ,
 name varchar(20) NOT NULL,
 email varchar(20) NOT NULL,
 country varchar(20)
);

DELIMITER //
CREATE PROCEDURE list_user()
BEGIN
    SELECT *
    FROM users_1;
    END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE update_user(
name varchar(20),
email varchar(20), 
country varchar(20),
id_user int
)
BEGIN
    update users_1
    set name = name, 
              email= email, 
			  country =country 
              where id = id_user;
    END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_user(id_user int)
BEGIN
    delete from users_1 where id = id_user;
    END //
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;
call list_user();
call delete_user();
call update_user();