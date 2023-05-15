create database bai_tap_ngay_2_bai_2;
use bai_tap_ngay_2_bai_2;
create table customer(
cid int primary key,
cName varchar(20),
cage int
);
create table `order`(
oid int primary key,
cid int,
foreign key (cid)references customer(cid),
odate date,
ototalprice double
);
create table product (
pid int primary key,
pname varchar(20),
pPrice double
);
create table orderdetail(
oid int,
pid int,
primary key(oid,pid),
odQty varchar(30)
);
	