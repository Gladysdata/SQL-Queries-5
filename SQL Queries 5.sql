USE sakila ;

#Drop column picture from staff
ALTER TABLE staff
DROP COLUMN picture;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly
INSERT INTO staff values ('3','TAMMY','SANDERS','5','Tammy.Sanders@sakilastaff.com','2','1','Tammy','21121c215c5','2023-01-01 00:00:01');
-- current_date

#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
INSERT INTO rental values( rental_id, current_date, 2 ,
 (select customer_id from customer where first_name='Charlotte' and last_name='Hunter'),'2023-01-10 00:00:01',
 (select staff_id from staff where first_name='Mike' and last_name='Hillyer'), current_date);

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted
#Check if there are any non-active users
SELECT * FROM customer
WHERE active = 0;

#Create a table backup table as suggested
CREATE TABLE deleted_users (
	`customer_id`int UNIQUE NULL,
    `active` int NULL,
	`email` VARCHAR(255) Null,
    date DATE NOT NULL
    ) ;
    
#Insert the non active users in the table backup table
INSERT INTO deleted_users () select * FROM customer WHERE `active` = 0;
SELECT * FROM deleted_users;
 
#Delete the non active users from the table customer (I kept getting an error on this one and found the solution on stak overflow https://stackoverflow.com/questions/1905470/cannot-delete-or-update-a-parent-row-a-foreign-key-constraint-fails)
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer
WHERE active IN ('0');
SELECT DISTINCT (active) FROM customer;
SET FOREIGN_KEY_CHECKS=1;




