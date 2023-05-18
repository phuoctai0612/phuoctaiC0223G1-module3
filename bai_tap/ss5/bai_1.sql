create database co_so_du_lieu_demo;
use co_so_du_lieu_demo;
-- drop database co_so_du_lieu_demo;
create table products(
id int primary key ,
product_Code int ,
product_Name varchar(20) ,
product_Price double,
product_Amount int,
product_Description varchar(20),
product_Status bit(1)
);
insert into products (id,product_Code,product_Name,product_Price,product_Amount,product_Description,product_Status)
value (1,1,"Máy Tính",2000,1,"Vip",1),
(2,2,"Laptop",2000,1,"Vip",1),
(3,3,"Mouse",2000,1,"Vip",1);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

create unique index index_name on products(product_Code);
CREATE INDEX index_name_1 ON products(product_Name,product_price);

explain select *
from products;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
create view view_name as
select product_Code, product_Name, product_Price, product_Status
from products
;
select *
from view_name;

update view_name
set product_name="Tai"
where product_code=1;

delete from view_name 
where product_code =2;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

Delimiter //
create procedure sp_name ()
begin
select *
from products;
end //
delimiter ;

Delimiter //
create procedure sp_name_1(id int, product_name varchar(20))
begin
insert into products(id,produc_name) value(id,product_name);
end //
delimiter ;

Delimiter //
create procedure sp_name_update(id int,product_name varchar(20))
begin
update products set product_name=product_name where id=id;
end //
delimiter ;

Delimiter //
create procedure sp_name_delete(id int)
begin
delete from products where id=id;
end //
delimiter ;
