create database Customer;
USE customer;
create table customer(
cID varchar(20) primary key,
cName varchar(20),
cAge int
);
create table `order`(
oID varchar(20) primary key,
cID varchar(20), foreign key (cid) references customer(cid),
odate datetime,
ototalprice double
);
create table product(
pID varchar(20) primary key,
pName varchar(20),
pPrice double
);
create table orderdetail(
oID varchar(20),foreign key (oId)references`order`(oid),
pID varchar(20),foreign key (pid) references product(pid)
);