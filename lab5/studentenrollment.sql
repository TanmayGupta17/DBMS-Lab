create table student(
regno varchar(20),
name varchar(20),
major varchar(20),
bdate date,
Primary Key(regno)
);

create table course(
course# int,
cname varchar(20),
dept varchar(20),
Primary Key(course#)
);

create table enroll(
regno varchar(20),
course# int,
sem int,
book_isbn int,
Foreign Key(regno) references student(regno),
Foreign Key(course#) references course(course#),
Foreign Key(book_isbn) references text(book_isbn)
);

create table Book_adoption(
course# int,
sem int,
book_isbn int,
Foreign Key(course#) references course(course#)
Foreign Key(book_isbn) references text(book_isbn)
);

create table text(
book_isbn int,
booktitle varchar(25),
publisher varchar(20),
author varchar (20),
Primary Key(book_isbn)
);

insert into student values ('1','Tanmay','CCE','17-Jun-2004');
insert into student values ('2','Shivam','CCE','18-Oct-2003');
insert into student values ('3','Lavitra','CSE','20-Aug-2004');
insert into student values ('4','Priyanshu','ECE','13-Feb-2004');
insert into student values ('5','Shrey','AIML','3-Feb-2004');

insert into course values (101,'DSA','CCE');
insert into course values (202,'DAA','CSE');
insert into course values (303,'OOPS','CCE');
insert into course values (404,'AI','AIML');
insert into course values (505,'CNP','ECE');

insert into text values(1001,'Data Structures','MAHE','Wiley');
insert into text values(2002,'Data Algorithm','MAHE','JP Dilhon');
insert into text values(3003,'Object Oriented Programs','IIT Delhi','Charles Johnson');
insert into text values(4004,'Artificial Intelligence','PES','DS Patel');
insert into text values(5005,'Computer Networks','PEC','Jason Pierson');

insert into enroll values('1',101,3,1001);
insert into enroll values('1',303,3,3003);
insert into enroll values('3',202,4,2002);
insert into enroll values('4',404,4,4004);
insert into enroll values('4',202,4,2002);

insert into book_adoption values(101,3,1001);
insert into book_adoption values(101,3,2002);
insert into book_adoption values(202,3,2002);
insert into book_adoption values(303,3,3003);
insert into book_adoption values(404,4,4004);
insert into book_adoption values(404,4,3003);

--List the courses which uses more than 1 text book.

select cname
from course
join book_adoption on course.course# = book_adoption.course#
group by cname
having count(book_adoption.book_isbn)>1;

--List the departments whose all course text books are published by a particular publisher

select course.dept
from course
join book_adoption on book_adoption.course# = course.course#
join text on text.book_isbn = book_adoption.book_isbn
where text.publisher = 'MAHE'
group by course.dept;

--Find the students who have enrolled for course of more than one department
select student.name, student.regno
from student
join(
select enroll.regno
from enroll
group by regno
having count(enroll.course#)>1
) en on student.regno = en.regno;

--Produce a list of students who are not enrolled.

select student.name, student.regno
from student
where student.regno not in(
select enroll.regno
from enroll
);

--List the department which adopts all the books from the particular publisher.

Select course.dept
from course
Where not exist (
    select *
    from book_adoption
    join text on text.book_isbn = book_adoption.book_isbn
    where course.course# = book_adoption.course#
    and text.publisher != 'MAHE'
);

--List the books which are adopted by the course as well as enrolled by the student.

SELECT DISTINCT t.booktitle
FROM BOOK_ADOPTION ba
JOIN TEXT t ON ba.book_isbn = t.book_isbn
JOIN ENROLL e ON ba.course# = e.course# AND ba.sem = e.sem AND ba.book_isbn = e.book_isbn;

--List the courses which has adapted at least two books from a specific publisher

