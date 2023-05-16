create database truy_van_csdl_quan_ly_sinh_vien;
use truy_van_csdl_quan_ly_sinh_vien;
create table bang_class(
class_id int auto_increment primary key,
class_name varchar(25),
start_date date,
status bit(1)
);
create table bang_student(
student_id int auto_increment primary key,
student_name varchar(25),
address varchar(20),
phone varchar(13),
status bit(1),
class_id int,
foreign key (class_id)references bang_class(class_id) 
);
create table bang_subject (
sub_id int auto_increment primary key,
sub_name varchar(25),
credit int ,
status bit(1)
);
create table bang_mark(
mark_id int auto_increment primary key,
sub_id int,
student_id int,
foreign key (sub_id) references bang_subject(sub_id),
foreign key (student_id) references bang_student(student_id),
mark int,
exam_times int
);

INSERT INTO bang_Class(class_name,start_date,status)
VALUES ('A1', '2008-12-20', 1),
 ('A2', '2008-12-22', 1),
 ('B3', current_date, 0);

INSERT INTO bang_Student (Student_Name, Address, Phone, Status, Class_Id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
 ('Hoa', 'Hai phong','0981849289' ,1, 1),
 ('Manh', 'HCM', '0123123123', 0, 2);
 
 INSERT INTO bang_Subject(sub_name,credit,status)
VALUES ( 'CF', 5, 1),
       ( 'C', 6, 1),
       ( 'HDJ', 5, 1),
       ( 'RDBMS', 10, 1);
       
INSERT INTO bang_Mark (Sub_Id, Student_Id, Mark, Exam_Times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- ---- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’---
select *
from bang_student
where student_name like "h%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12--
select *
from bang_class
where month(start_date)=12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
select *
from bang_subject
where credit>3 and credit <6;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
update bang_student
set class_id =2
where student_id=1 and student_name='Hung';
select *
from bang_student;
-- --- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần---
select bang_student.student_name, bang_subject.sub_name,bang_mark.mark
from bang_student 
join bang_mark 
on bang_student.student_id=bang_mark.student_id
join bang_subject
on bang_subject.sub_id=bang_mark.sub_id
order by bang_mark.mark desc , bang_student.student_name ;

