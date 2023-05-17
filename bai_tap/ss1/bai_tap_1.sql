create database hoc_sinh_giao_vien ;
use hoc_sinh_giao_vien ;
create table table1 (
      id int primary key auto_increment ,
      nameStudent varchar(45)
);
insert into table1(nameStudent)
value ("Tai"),("Kiet");

select * from table1;
alter table table1 rename to Student;
create table Teacher (
id int primary key auto_increment,
nameTeacher varchar(45),
age int,
country varchar(45)
);
insert into teacher(nameTeacher,age,country)
value("ChanhTv",35,"DaNang");
select * from Teacher
