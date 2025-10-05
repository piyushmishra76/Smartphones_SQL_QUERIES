use campus_x;
create table users(
user_id INTEGER primary key auto_increment,
name varchar(255),
email varchar(255) not null unique,
passwordd varchar(255) not null
);
-- Insert query syntax
-- INSERT INTO DATABASE.TABLE_NAME(COLUMNS_NAMES)
-- INSERT INTO users (name,email,passwordd)
-- VALUES ('Piyush','piyushmishra@gmail.com','maaapaapa')
-- Also we can directly insert the value in the table without passing their column name but in order
-- insert into users
-- values(2,NULL,'Mishra2323@gmail.com','paspspsa')
-- IF we dont remember the order of the columns then we can insert it by declaring the orders
-- insert into users(passwordd, name,email)
-- values('maaopaoaa','mishraji','mishra@3232gmial.com')
-- for inserting multiple data in a time
insert into users values
(null,'piyush','mishp@','piyush123'),
(null,'souabh','sk@','satya321'),
(null,'satyam','sm@','sourabh321231')