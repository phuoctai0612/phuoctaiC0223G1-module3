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
-- alter table khach_hang modify column gioi_tinh varchar()
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
value(1,"quản lý"),(2,"nhân viên");
select * from vi_tri;
insert into trinh_do(ma_trinh_do,ten_trinh_do)
value(1,"Trung cấp"),(2,"Cao đẳng"),(3,"Đại học"),(4,"sau đại học");
select * from trinh_do;
insert into bo_phan(ma_bo_phan,ten_bo_phan)
value(1,"Sale – Marketing"),(2,"Hành Chính"),(3,"Phục vụ"),(4,"Quản lý");
select * from bo_phan;
insert into nhan_vien(ma_nhan_vien,ho_va_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
value (1,"Nguyễn Văn An",19701107,456231786,10000000,0901234121,"annguyen@gmail.com","295 Nguyễn Tất Thành Đà Nẵng",1,3,1), 
(2,"Lê Văn Bình",19970409,654231234,7000000,0934212314,"binhlv@gmail.com","22 Yên Bái Đà Nẵng",1,2,2),
(3,"Hồ Thị Yến",19951212,999231723,14000000,0412352315,"thiyen@gmail.com","K234/11 Điện Biên Phủ Gia Lai",1,3,2),
(4,"Võ Công Toản",19800404,123231365,17000000,0374443232,"toan0404@gmail.com","77 Hoàng Diệu Quảng Trị",1,4,4),
(5,"Nguyễn Bỉnh Phát",19991209,454363232,6000000,0902341231,"phatphat@gmail.com","43 Yên Bái Đà Nẵng",2,1,1),
(6,"Khúc Nguyễn An Nghi",20001108	,964542311,7000000,0978653213,"annghi20@gmail.com","294 Nguyễn Tất Thành Đà Nẵng",2	,2,	3),
(7,"Nguyễn Hữu Hà",	19930101,	534323231,8000000,0941234553,"nhh0101@gmail.com","4 Nguyễn Chí Thanh Huế",	2,3	,2),
(8,"Nguyễn Hà Đông",19890903,234414123,9000000,0642123111,"donghanguyen@gmail.com","111 Hùng Vương Hà Nội",2,4,4),
(9,"Tòng Hoang",19820903,	256781231,6000000,0245144444,"hoangtong@gmail.com","213 Hàm Nghi Đà Nẵng",2	,4,	4),
(10,"Nguyễn Công Đạo",19940108,755434343,	8000000,0988767111,"nguyencongdao12@gmail.com","6 Hoà Khánh Đồng Nai",2,3,2);
select * from nhan_vien;
insert into loai_khach(ma_loai_khach,ten_loai_khach)
value(1,"Diamond"),(2,"Platinium"),(3,"Gold"),(4,"Silver"),(5,"Member");
select * from loai_khach;
insert into khach_hang(ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
value(1,"Nguyễn Thị Hào",19701107,0,643431213,0945423362,"thihao07@gmail.com","23 Nguyễn Hoàng Đà Nẵng",5),
(2,"Phạm Xuân Diệu",19920808,1,865342123,0954333333,"xuandieu92@gmail.com","K77/22 Thái Phiên Quảng Trị",3), 
(3,"Trương Đình Nghệ",19900227,1,488645199,0373213122,"nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm Vinh",1),
(4,"Dương Văn Quan",19810708,1,543432111,0490039241,"duongquan@gmail.com","K453/12 Lê Lợi Đà Nẵng",1),
(5,"Hoàng Trần Nhi Nhi",19951209,0,795453345,0312345678,"nhinhi123@gmail.com","224 Lý Thái Tổ Gia Lai",4),
(6,"Tôn Nữ Mộc Châu",20051206,0,732434215,0988888844,"tonnuchau@gmail.com","37 Yên Thế Đà Nẵng",4),
(7,"Nguyễn Mỹ Kim",	19840408,0,856453123,0912345698,"kimcuong84@gmail.com","K123/45 Lê Lợi Hồ Chí Minh",1),
(8,"Nguyễn Thị Hào",19990408,0,965656433,0763212345,"haohao99@gmail.com","55 Nguyễn Văn Linh Kon Tum",3),
(9,"Trần Đại Danh",	19940701,1,432341235,0643343433,"danhhai99@gmail.com","24 Lý Thường Kiệt Quảng Ngãi",1),
(10,"Nguyễn Tâm Đắc",19890701,1,344343432,0987654321,"dactam@gmail.com","22 Ngô Quyền Đà Nẵng",2);
select * from khach_hang;
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
value(1,20201208,20201208,0,3,1,3),
(2,20200714,20200721,200000,7,3,1),
(3,20210315,20210317,50000,3,4,2),
(4,20210114,20210118,100000,7,5,5),
(5,20210714,20210715,0,7,2,6),
(6,20210601,20210603,0,7,7,6),
(7,20210902,20210905,100000,7,4,4),
(8,20210617,20210618,150000,3,4,1),
(9,20201119,20201119,0,3,4,3),
(10,20210412,20210414,0,10,3,5),
(11,20210425,20210425,0,2,2,1),
(12,20210525,20210527,0,7,10,1);
select * from hop_dong;
insert into hop_dong_chi_tiet(ma_hop_dong_chi_tiet,so_luong,ma_hop_dong,ma_dich_vu_di_kem)
value(1,5,2,4),
(2,8,2,5),
(3,15,2,6),
(4,1,3,1),
(5,11,3,2),
(6,1,1,3),
(7,2,1,2),
(8,2,12,2);
insert into dich_vu_di_kem(ma_dich_vu_di_kem,ten_dich_vu_di_kem,gia,don_vi,trang_thai)
value(1,	"Karaoke"	,10000	,"giờ", "tiện nghi, hiện tại"),	
(2,"	Thuê xe máy",	10000,	"chiếc",	"hỏng 1 xe"),
(3,	"Thuê xe đạp",	20000,	"chiếc","tốt"),
(4,	"Buffet buổi sáng",	15000,	"suất",	"đầy đủ đồ ăn, tráng miệng"),
(5,	"Buffet buổi trưa"	,90000,"	suất",	"đầy đủ đồ ăn, tráng miệng"),
(6,	"Buffet buổi tối"	,16000	,"suất",	"đầy đủ đồ ăn, tráng miệng");
insert into loai_dich_vu(ma_loai_dich_vu,ten_loai_dich_vu)
value(1,"Villa"),(2,"House"),(3,"Room");
insert into kieu_thue(ma_kieu_thue,ten_kieu_thue)
value(1,"year"),(2,"month"),(3,"day"),(4,"hour");
insert into dich_vu(ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
value (1,"Villa Beach Front",25000,10000000,10,"vip","Có hồ bơi",500,	4,3,1),
(2,"House Princess 01",14000,5000000,7,"vip","Có thêm bếp nướng",null,3,2,2),
(3,"Room Twin 01",5000,1000000,2,"normal","Có tivi",null,null,4,3),
(4,"Villa No Beach Front",22000,9000000,8,"normal","Có hồ bơi",300,3,3,1),
(5,"House Princess 02",10000,4000000,5,"normal","Có thêm bếp nướng",null,2,3,2),
(6,"Room Twin 02",3000,900000,2,"normal","Có tivi",null,null,4,3)
;
select * from vi_tri;
select * from trinh_do;
select * from bo_phan;
select * from nhan_vien;
select * from khach_hang;
select * from kieu_thue;
select * from loai_dich_vu;
select * from dich_vu;
select * from dich_vu_di_kem;
select * from hop_dong;
select * from hop_dong_chi_tiet;
select * from loai_khach;
-- ----- bài 2-----
select *
from nhan_vien
where ho_va_ten like "H%" or ho_va_ten like "T%" or ho_va_ten like "K%" and char_length(ho_va_ten)<=15;
-- -------bài 3--------
select * 
from khach_hang 
where ( TIMESTAMPDIFF(year,khach_hang.ngay_sinh,curtime())>=18
 and (TIMESTAMPDIFF(year,khach_hang.ngay_sinh,curtime()) <=50)) and dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng Trị%";

-- --------------bai 4 -------------
select kh.ma_khach_hang, kh.ho_ten,count(kh.ma_khach_hang) as "Số lần đặt"
from loai_khach lk
join khach_hang kh
on kh.ma_loai_khach=lk.ma_loai_khach
join  hop_dong hd
on hd.ma_khach_hang=kh.ma_khach_hang
join dich_vu dv
on dv.ma_dich_vu=hd.ma_dich_vu
where lk.ten_loai_khach="Diamond"
group by kh.ma_khach_hang
order by count(kh.ma_khach_hang) asc;
-- -----------------bai 5------------------
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,
hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,(dv.chi_phi_thue*hdct.so_luong+dv.chi_phi_thue) as "tổng tiền"
from khach_hang kh
left join hop_dong hd
on kh.ma_khach_hang=hd.ma_khach_hang
left join hop_dong_chi_tiet hdct
on  hd.ma_hop_dong=hdct.ma_hop_dong
left join dich_vu dv
on hd.ma_dich_vu=dv.ma_dich_vu
left join loai_khach lk
on lk.ma_loai_khach=kh.ma_loai_khach
order by kh.ma_khach_hang


