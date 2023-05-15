create database bai_tap_1;
use bai_tap_1;
create table phieuxuat(
sopx int primary key,
ngayxuat date
);
create table vattu(
mavtu int primary key,
tenvtu varchar(20)
);
create table phieuxuat_vattu(
dgxuat int ,
slxuat int ,
sopx int,
mavtu int,
primary key(sopx,mavtu),
foreign key (sopx) references phieuxuat(sopx),
foreign key (mavtu) references vattu(mavtu)
);

create table phieunhap(
sopn int primary key,
ngaynhap date
);
create table vattu_phieunhap(
dgnhap int,
slnhap int,
mavtu int,
sopn int,
primary key(mavtu,sopn),
foreign key (mavtu)references vattu(mavtu),
foreign key (sopn)references phieunhap(sopn)
);
create table dondh(
sodh int primary key,
ngaydh date
);
create table nhacc(
mancc int primary key,
tenncc varchar(30),
diachi varchar(50)
);
create table dondh_vattu(
sodh int,
mavtu int,
mancc int,
primary key(sodh,mavtu),
foreign key (sodh)references dondh(sodh),
foreign key (mavtu)references vattu(mavtu),
foreign key (mancc)references nhacc(mancc)
);
create table sdt(
mancc int, foreign key (mancc)references nhacc(mancc),
sdt varchar(13)
);
