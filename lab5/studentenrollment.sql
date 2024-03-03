 create table student(
  2  regno varchar(20),
  3  name varchar(20),
  4  major varchar(20),
  5  bdate date,
  6  Primary Key(regno)
  7  );

create table course(
  2  course# int,
  3  cname varchar(20),
  4  dept varchar(20),
  5  Primary Key(course#)
  6  );

create table enroll(
  2  regno varchar(20),
  3  course# int,
  4  sem int,
  5  book_isbn int,
  6  Foreign Key(regno) references student(regno),
  7  Foreign Key(course#) references course(course#),
  8  Foreign Key(book_isbn) references text(book_isbn)
  9  );

create table Book_adoption(
  2  course# int,
  3  sem int,
  4  book_isbn int,
  5  Foreign Key(course#) references course(course#)
  6  Foreign Key(book_isbn) references text(book_isbn)
  7  );

create table text(
  2  book_isbn int,
  3  booktitle varchar(25),
  4  publisher varchar(20),
  5  author varchar (20),
  6  Primary Key(book_isbn)
  7  );

--List the courses which uses more than 1 text book.

 select cname
  2  from course
  3  join book_adoption on course.course# = book_adoption.course#
  4  group by cname
  5  having count(book_adoption.book_isbn)>1;

--List the departments whose all course text books are published by a particular publisher

select course.dept
  2  from course
  3  join book_adoption on book_adoption.course# = course.course#
  4  join text on text.book_isbn = book_adoption.book_isbn
  5  where text.publisher = 'MAHE'
  6  group by course.dept;

--Find the students who have enrolled for course of more than one department
