-- Q1:  Creating the schema and required tables using MySQL workbench.
-- a.Create a schema named Travego and create the tables mentioned above with the mentioned columnnames. Also, declare there relevant datatypes for each feature/column in the dataset. 
create database Travego;
use Travego;

create table passengers(
Passenger_id INT, 
Passenger_name VARCHAR(20),
Category VARCHAR(20),
Gender VARCHAR(20),
Boarding_City VARCHAR(20),
Destination_City VARCHAR(20),
Distance int,
Bus_Type VARCHAR(20)
);

create table Price(
id INT,
Bus_Type Varchar(20),
Distance int,
Price INT
);

-- b.Insert the data in the newly created tables.
insert into Passengers
values (1,"Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper"),
(2,"Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting"),
(3,"Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper"),
(4,"Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper"),
(5,"Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper"),
(6,"Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting"),
(7,"Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper"),
(8,"Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting"),
(9,"Piyush","AC","M","Pune","Nagpur",700,"Sitting");

insert into Price 
values(1,"Sleeper",350,770),(2,"Sleeper",500,1100),(3,"Sleeper",600,1320),
(4,"Sleeper",700,1540),(5,"Sleeper",1000,2200),
(6,"Sleeper",1200,2640),(7,"Sleeper",1500,2700),(8,"Sitting",500,620),(9,"Sitting",600,744),
(10,"Sitting",700,868),(11,"Sitting",1000,1240),(12,"Sitting",1200,1488),(13,"Sitting",1500,1860);

-- a.How many female passengers traveled a minimum distance of 600KMs? 
select * from passengers
where Gender="F" and Distance >= 600;

-- b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. 
select * from passengers
where Distance > 500 and Bus_Type = "Sleeper";

-- c.Select passenger names whose names start with the character 'S'. 
select * from passengers
where Passenger_name like ("S%");

-- d.Calculate the price charged for each passenger,displaying the Passenger name,Boarding City,Destination City,Bus type,and Price in the output.
select ps.Passenger_name,ps.Boarding_City,ps.Destination_City,pr.Bus_type, pr.Price from passengers ps
left join price pr
on ps.passenger_id = pr.id;

-- e.What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?

select ps.passenger_name,pr.bus_type,  pr.price from passengers ps
left join price pr
on ps.passenger_id = pr.id
where pr.distance >= 1000 and pr.bus_type = "sitting";
;

-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select * from passengers ps
join price pr
on ps.passenger_id = pr.id
where ps.boarding_city = "Banglore" and ps.destination_city = "Panaji" ;
-- or
select * from price
where distance = 600;

-- g.Alter the column category with the value "Non-AC" where the Bus_Type is sleeper?
UPDATE passengers
SET category = 'Non-AC'
WHERE Bus_Type = 'sleeper' AND category = 'AC';
 
-- h.Delete an entry from the table where the passenger name is Piyus hand commit this change in the database.
 delete from passengers 
 where passenger_name = "piyush"; 

-- i.Truncate the table passenger and comment on the number of rows in the table (explain if required).
Truncate table passengers; 

--  j.Delete the table passenger from the database.
drop database passengers;










