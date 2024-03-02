 create table person(
  2  driver_id# varchar(20),
  3  name varchar(20),
  4  address varchar(20),
  5  primary key(driver_id#)
  6  );

 create table car(
  2  regno varchar(20),
  3  model varchar(20),
  4  year int,
  5  primary key(regno)
  6  );

create table accident(
  2  report_number int,
  3  accd_date date,
  4  location varchar(20),
  5  primary key (report_number)
  6  );

 create table owns(
  2  driver_id# varchar(20),
  3  regno varchar (20),
  4  foreign key(driver_id#) references person(driver_id#),
  5  foreign key(regno) references car(regno)
  6  );

 create table participated(
  2  driver_id# varchar(20),
  3  regno varchar (20),
  4  report_number int,
  5  damage_amount int,
  6  foreign key(driver_id#) references person(driver_id#),
  7  foreign key(regno) references car(regno),
  8  foreign key(report_number) references accident(report_number)
  9  );

insert into person values ('1','Tanmay','Anand');
insert into person values ('2','Shivam','Uttrakhand');
insert into person values ('3','Vansh','Mumbai');
insert into person values('4','Rushil','Mumbai');
insert into person values('5','Swagat','Pune');

insert into car values ('470','Supra',2001);
insert into car values ('458','Toyota',2004);
insert into car values ('525','Hyndai',2006);
insert into car values ('560','Honda',2008);
insert into car values ('590','Kia',2010);

insert into accident values (10,'22-Nov-2001','Anand');
insert into accident values (11,'2-Jan-2005','Lucknow');
insert into accident values (12,'2-Jan-2006','Mirzapur');
insert into accident values (13,'14-Feb-2007','Thane');
insert into accident values (14,'20-March-2011','Pune');

insert into owns values ('1','470');
insert into owns values ('2','458');
insert into owns values ('3','525');
insert into owns values ('4','560');
insert into owns values ('5','590');

insert into participated values('1','470',10,12000);
insert into participated values('2','458',11,3000);
insert into participated values('3','525',12,10000);
insert into participated values('4','560',13,8000);
insert into participated values('5','590',14,4000);

#Update the damage amount to 25000 for the car with a specific reg. no in a PARTICIPATED table with report number 12

Update participated set damage_amount = 25000 where regno = 525;

#Delete the accident and related information that took place in a specific year. 

delete from participated where report_number in (select report_number from accident where extract(year from accd_date)=2005);
delete from accident where extract(year from accd_date) = 2005;

#Alter table to add and delete an attribute.

alter table person add phone_number int;
alter table person drop column phone_number;

#Alter table to add Check constraint

alter table participated add check(damage_amount > 1000);

