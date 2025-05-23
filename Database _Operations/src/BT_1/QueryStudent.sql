create schema QuanLySinhVien;
use QuanLySinhVien;

create table Class(
	ClassID int not null auto_increment primary key,
	ClassName varchar(60) not null,
    StartDate datetime not null,
    Status bit
);
create table Student(
	StudentID int not null auto_increment primary key,
	StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    Status bit,
    ClassID int not null,
    foreign key (ClassID) references Class(ClassID)
);
create table Subject(
	SubID int not null auto_increment primary key,
	SubName varchar(30) not null,
    Credit tinyint not null
    default 1 Check (Credit >= 1),
    Status bit default 1
);
CREATE TABLE Mark(
	MarkId int not null auto_increment primary key,
	SubId int not null,
	StudentId int not null,
	Mark float default 0 check ( Mark between 0 and 100),
	ExamTimes tinyint default 1,
	unique (SubId, StudentId),
	foreign key (SubId) references Subject (SubId),
	foreign key (StudentId) references Student (StudentId)
 );

 insert into Class (ClassName, StartDate, Status)
 values ('A1', '2008-12-20', 1);
 insert into Class(ClassName, StartDate, Status)
 values ('A2', '2008-12-22', 1);
 insert into Class(ClassName, StartDate, Status)
 values ('B3', current_date, 0);

 insert into Student (StudentName, Address, Phone, Status, ClassId)
 values ('Hung', 'Ha Noi', '0912113113', 1, 1);
 insert into Student (StudentName, Address, Phone, Status, ClassId)
 values ('Hoa', 'Hai phong', '0923982098', 1, 1);
 insert into Student (StudentName, Address, Phone, Status, ClassId)
 values ('Manh', 'HCM', '0123123123', 0, 2);

 insert into Subject (SubName, Credit, status)
 values ('CF', 5, 1),
 ('C', 6, 1),
 ('HDJ', 5, 1),
 ('RDBMS', 10, 1);

 insert into Mark (SubId, StudentId, Mark, ExamTimes)
 values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);

select * from Student;
select * from Student
where Status = true;

select * from Subject
where Credit < 10;

select S.StudentID, S.StudentName, C.ClassName
from Student S join Class C on S.ClassId = C.ClassID
where C.ClassName = 'A1';

select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';

select * from Student
where lower(StudentName) like 'h%';

select * from Class
where month(StartDate) = 12;

select * from Subject
where Credit between 3 and 5;

update Student
set ClassID = 2
where StudentName = 'Hung';

select s.StudentName, sub.SubName, m.Mark
from Mark m
join Student s on m.StudentID = s.StudentID
join Subject sub on m.SubID = sub.SubID
order by m.Mark DESC, s.StudentName ASC;