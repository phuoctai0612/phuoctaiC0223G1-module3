create database bai_tap_1;
use bai_tap_1;
drop database bai_tap_1;
create table phieu_xuat(
so_px int primary key,
ngay_xuat date
);
create table vat_tu(
ma_vtu int primary key,
ten_vtu varchar(20)
);
create table phieu_xuat_vat_tu(
dg_xuat int ,
sl_xuat int ,
so_px int,
ma_vtu int,
primary key(so_px,ma_vtu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap date
);
create table vat_tu_phieu_nhap(
dg_nhap int,
sl_nhap int,
ma_vtu int,
so_pn int,
primary key(ma_vtu,so_pn),
foreign key (ma_vtu)references vat_tu(ma_vtu),
foreign key (so_pn)references phieu_nhap(so_pn)
);
create table don_dh(
so_dh int primary key,
ngay_dh date
);
create table nha_cc(
ma_ncc int primary key,
ten_ncc varchar(30),
dia_chi varchar(50)
);
create table don_dh_vat_tu(
so_dh int,
ma_vtu int,
ma_ncc int,
primary key(so_dh,ma_vtu),
foreign key (so_dh)references don_dh(so_dh),
foreign key (ma_vtu)references vat_tu(ma_vtu),
foreign key (ma_ncc)references nha_cc(ma_ncc)
);
create table sdt(
ma_ncc int, foreign key (ma_ncc)references nha_cc(ma_ncc),
sdt varchar(13)
);
