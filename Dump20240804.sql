create Database BusmanagementSystem;

use BusmanagementSystem;

--create tables

Create table BusRider(
RiderID Int Auto_Increment primary key,
type varchar(50),
personalcharacteristics varchar(255));

Create table Fare(
FareID int Auto_increment primary key,
riderclass varchar(50),
routeType varchar(50));

create table Route(
RouteID int auto_increment primary key,
type varchar(50));

create table BusStop(
StopID int auto_increment primary key,
Location varchar(225));
select * from BusStop
create table Routestop(
RouteID int,
stopID int,
Primary key (RouteID,StopID),
Foreign key (RouteID) References Route(RouteID),
Foreign Key (StopID) References BusStop(StopID));

create table RouteTimingSchedule(
ScheduleID int auto_increment primary key,
RouteID int,
KeyStopTimes Varchar(200),
starttime time,
Foreign key (RouteID) references Route(RouteID));

create table ScheduleType(
ScheduleTypeID int auto_increment primary key,
Type varchar(50));
Drop ScheduleType

create table BusDriverTable(
EmployeeID int auto_increment primary key,
Name Varchar(50),
LicenseNumber Varchar(50));

CREATE TABLE DriverSchedule (
    DriverScheduleID INT AUTO_INCREMENT PRIMARY KEY,
    Employee INT,
    RouteID INT,
    WeeklySchedule VARCHAR(255),
    date DATE,
    time TIME,
    FOREIGN KEY (Employee) REFERENCES BusDriverTable(EmployeeID),
    FOREIGN KEY (RouteID) REFERENCES Route(RouteID)
);

--Adding data
insert into fare (Riderclass, Routetype)
values('Tourist','city'),('regular','Intercity'),('Occasional','city'),('Monthly Pass','Suburban');

insert into BusRider(Type, personalcharacteristics,RiderID)
values('Regular','prefers window seat',1),
('Occasional','likes window seat',2),
('Daily','Prefers quiet area',3),
('Frequent','Likes back seats',4);

insert into Route (type) values
('Express'),('local'),('integrity'),('Night');

insert into Busstop(Location)
values('Downtown'),('uptwon'),('suburb Central'),('Airport'),('University');

insert into RouteStop(RouteID,StopID)
Values(1,1),(1,4),(2,2),(2,3),(3,1),(3,2),(4,1),(4,2)

insert into ScheduleType(Type) 
values('Weekday'),('weekend'),('Holiday');

insert into RouteTimingSchedule(RouteID, KeyStopTimes, Starttime)
values(1,'08:00,12:00,18:00','08:00:00'),
(2,'09:00,13:00,19:00','09:00:00'),
(3,'10:00,14:00,20:00','10:00:00'),
(4,'11:00,15:00,21:00','11:00:00');

insert into BusDriver(Name, LicenseNumber)
Values('John Doe','AB344985'),
('Jane Smith','CD937595739'),
('Mike J', 'EF985937572091'),
('Emily D','Gh1w272094');

insert into DriverSchedule(employeeID,RouteID,WeeklySchedule,Date,Time)
Values(1, 1, 'Mon-Fri', '2024-08-01','08:00:00'),
(2, 2, 'sat-sun', '2024-08-02','09:00:00'),
(3, 3, 'mon-Fri', '2024-08-03','10:00:00'),
(4, 4, 'sat-sun', '2024-08-04','11:00:00');

--1. Retrieve all bus riders and their associated
