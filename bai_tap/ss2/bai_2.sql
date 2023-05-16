create database bai_tap_2;
use bai_tap_2;

create table customer(
c_id int primary key,
c_Name varchar(20),
c_age int
);
create table `order`(
o_id int primary key,
c_id int,
foreign key (c_id)references customer(c_id),
o_date date,
o_total_price double
);
create table product (
p_id int primary key,
p_name varchar(20),
p_Price double
);
create table order_detail(
o_id int,
p_id int,
primary key(o_id,p_id),
o_d_Qty varchar(30)
);
	