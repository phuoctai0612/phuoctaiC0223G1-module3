create database quan_li_sinh_vien;
use quan_li_sinh_vien;
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
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select bang_subject.sub_name,max(credit)
from bang_subject
join bang_mark
on bang_subject.sub_id=bang_mark.sub_id
group by bang_subject.sub_id;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select bang_subject.sub_name,max(mark)
from bang_subject
join bang_mark
on bang_subject.sub_id=bang_mark.sub_id
group by bang_subject.sub_id
order by max(mark) desc
limit 1;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select bang_student.student_name,avg(bang_mark.mark)
from bang_student
left join bang_mark
on bang_student.student_id=bang_mark.student_id
group by bang_student.student_id