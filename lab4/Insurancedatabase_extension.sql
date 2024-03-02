--Find the total number of people who owned cars that were involved in accidents in 2008

SELECT COUNT(DISTINCT person.driver_id#) AS total_people
  2  FROM person
  3  JOIN participated ON person.driver_id# = participated.driver_id#
  4  JOIN accident ON participated.report_number = accident.report_number
  5  WHERE EXTRACT(YEAR FROM accident.accd_date) = 2008;

--Find the number of accidents in which cars belonging to a specific model were involved.

select count(accident.report_number)
  2  from accident
  3  join participated on participated.report_number = accident.report_number
  4  join car on car.regno = participated.regno
  5  where model = 'Honda';

--Produce a listing with header as OWNER_NAME, No. of Accidents, and Total Damage Amount in a descending order on total damage.

 select person.name as owner_name, count(accident.report_number) as No_of_Accidents, sum(damage_amount) as Total_damage_amount
  2  from person
  3  join participated on person.driver_id# = participated.driver_id#
  4  join accident on participated.report_number = accident.report_number
  5  group by person.name
  6  order by total_damage_amount;

--List the Owners who made more than 2 accidents in a year.

Select participated.driver_id#
  2  from participated
  3  join accident on accident.report_number = participated.report_number
  4  having count(participated.report_number)>1
  5  group by driver_id#;

--List the owners who are not involved in any accident.

 select name,driver_id#
  2  from person
  3  where driver_id# not in (select driver_id# from participated);
