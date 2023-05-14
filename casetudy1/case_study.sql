create database caseStudy;
use casestudy;
create table vi_tri(
ma_vi_tri int primary key ,
ten_vi_tri varchar(45)
);
create table trinh_do(
ma_trinh_do int primary key ,
ten_trinh_do varchar(45)
);
create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(45)
);
create table nhan_vien(
   ma_nhan_vien int primary key ,
   ho_va_ten varchar(45) not null,
   ngay_sinh date not null,
   so_cmnd varchar(45) not null,
   luong double not null,
   so_dien_thoai varchar(45) not null,
   email varchar(45),
   dia_chi varchar(45),
  ma_vi_tri int , foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    ma_trinh_do int , foreign key (ma_trinh_do)references trinh_do(ma_trinh_do),
    ma_bo_phan int , foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);
create table khach_hang(
ma_khach_hang int primary key,
ma_loai_khach int , foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);
create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int , foreign key(ma_nhan_vien)references nhan_vien(ma_nhan_vien),
ma_khach_hang int , foreign key(ma_khach_hang)references khach_hang(ma_khach_hang),
ma_dich_vu int,foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int ,foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int  not null
);
create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);
create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);
create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);
create table dich_vu(
ma_dich_vu int primary key ,
ten_dich_vu varchar(45) not null,
dien_tich int ,
chi_phi_thue double not null,
so_nguoi_toi_da int ,
ma_kieu_thue int , foreign key (ma_kieu_thue)references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int ,foreign key (ma_loai_dich_vu)references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double ,
so_tang int	
);
insert into vi_tri(ma_vi_tri,ten_vi_tri)
value(1,"Lễ tân"),(2,"phục vụ"),(3,"chuyên viên"),(4,"giám sát"),(5,"quản lý"),(6,"giám đốc");
select * from vi_tri;
insert into trinh_do(ma_trinh_do,ten_trinh_do)
value(1,"Trung cấp"),(2,"Cao đẳng"),(3,"Đại học"),(4,"sau đại học");
select * from trinh_do;
insert into bo_phan(ma_bo_phan,ten_bo_phan)
value(1,"Sale – Marketing"),(2,"Hành Chính"),(3,"Phục vụ"),(4,"Quản lý");
select * from bo_phan;
insert into nhan_vien(ma_nhan_vien,ho_va_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
value (1,"Nguyen Viet Quoc",19950612,"asda",23131323,"0912312381283","vietquoc@gmail.com","Da Nang",1,1,1)
, (2,"Nguyen Viet Quoc",19950612,"asda",091231238,"vietquoc@gmail.com","vietquoc@gmail.com","Da Nang",1,1,1);
-- delete from nhan_vien where ma_nhan_vien=3;
select * from nhan_vien;
insert into loai_khach(ma_loai_khach,ten_loai_khach)
value(1,"Diamond"),(2,"Platinium"),(3,"Gold"),(4,"Silver"),(5,"Member");
select * from loai_khach;
insert into khach_hang(ma_khach_hang,ma_loai_khach,ho_ten,ngay_sinh,so_cmnd,so_dien_thoai,email,dia_chi)
value(1,2,"Mai Phuoc Tai",20011206,"0987654421","0981849289","sieuem@gmail.com","Binh An");
select * from khach_hang;
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
value(1,20231506,20232006,200,1,1,1);
insert into hop_dong_chi_tiet(ma_hop_dong_chi_tiet,ma_hop_dong,ma_dich_vu_di_kem,so_luong)
value(1,2,2,2);
insert into dich_vu_di_kem(ma_dich_vu_di_kem,ten_dich_vu_di_kem,gia,don_vi,trang_thai)
value(1,"a",11,"aa","aa");
