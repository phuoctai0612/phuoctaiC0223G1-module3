create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_ID int primary key,
c_Name varchar(20),
c_Age int
);
create table `order`(
o_ID int primary key,
c_ID int, foreign key (c_id) references customer(c_id),
o_date datetime,
o_total_price double
);
create table product(
p_ID int primary key,
p_Name varchar(20),
p_Price double
);
create table order_detail(
o_ID int,foreign key (o_Id)references`order`(o_id),
p_ID int,foreign key (p_id) references product(p_id),
od_qty int 
);
insert into customer(c_id,c_name,c_age)
value (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);
insert into `order`(o_ID,c_ID,o_date,o_total_price)
value(1,1,20060321,Null),
(2,2,20060323,Null),
(3,1,20060316,Null);
insert into product(p_ID,p_Name,p_Price)
value (1,"May giat",3),
(2,"Tu lanh",5),
(3,"Dieu hoa",7),
(4,"Quat",1),
(5,"Bep dien",2);
insert into order_detail(o_id,p_id,od_qty)
value(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select *
from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.c_name, product.p_name,o_date
from customer
join `order` 
on customer.c_id= `order`.c_id
join order_detail
on `order`.o_id=order_detail.o_id
join product 
on order_detail.p_id=product.p_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_name
from customer
left join `order` 
on customer.c_id= `order`.c_id 
where `order`.c_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id , o.o_date,sum(od.od_QTY*p.p_Price) as "tổng"
from `order` o
join order_detail od
on o.o_id=od.o_id
join product p
on od.p_id=p.p_id
group by o.o_id