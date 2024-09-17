create database Healtcare;

use Healtcare;

create table patient( 
patient_id int primary key,
first_name varchar (100) not null,
last_name varchar (100) not null,
dob date not null,
gender varchar (10),
adress text,
phone varchar (30)

);

insert into patient
(patient_id, first_name,  last_name, dob, gender, adress, phone)
values
(1,"Hamza","Siddique",'2001-03-10',"Men",'Hasilpur','+923005065785'),
(2,"Ali","Talha",'2003-04-26',"Men",'Darawala','+923005065786'),
(3,"Ayesha","Siddique",'2004-06-06',"Women",'Hasilpur','+923005065787'),
(4,"Zeeshan","Ali",'2000-11-15',"Men",'Bwp','+923005065788'),
(5,"Hamza","Ali",'2002-01-12',"Men",'Darawala','+923005065789'),
(6,"Momina","Saeed",'2008-03-29',"Women",'Bwp','+923005065790');


create table Doctor(
doctor_id int primary key,
first_name varchar (100) not null,
last_name varchar (100) not null,
specialization varchar (100) not null,
sehedule text
);

insert into Doctor
(doctor_id, first_name, last_name, specialization, sehedule)
values
(1, "john", "Doe", 'cardiology', 'Mon-Fri : 9 AM - 5PM'),
(2, "jane", "Smith", 'Dermatology', 'Thu-Sat: 11 AM - 6PM'),
(3, "Amir", "Hussain", 'Neurology', 'Mon- Wed : 8 Am - 2PM'),
(4, "Sana", "Fareed", 'Childspealist', 'Mon-Thu : 9 AM - 1PM'),
(5, "John", "Cena", 'Bonespeialist', 'Sat-Fri : 12 PM - 9PM'),
(6, "Hamza", "Siddique", 'Heartspecialist', 'Mon-Mon : 8AM - 3PM');


create table Appointment (
appointment_id int primary key,
patient_id int not null,
doctor_id int not null,
appointment_date datetime
 not null,
 foreign key (patient_id) references patient (Patient_id),
 foreign key (doctor_id) references Doctor (doctor_id)
);

insert into Appointment
( appointment_id,  patient_id, doctor_id, appointment_date)
values
(101, 1, 6, '2024-08-19'),
(102, 2, 5, '2024-09-21'),
(103, 6, 4, '2024-10-22'),
(104, 3, 3, '2024-12-23'),
(105, 4, 2, '2025-01-19'),
(106, 5, 1, '2025-02-10');

create table Billing(
billing_id int primary key,
patient_id int not null,
amount decimal (10,2) not null,
billing_date date not null,
payment_status varchar (50) not null,
foreign key (patient_id) references patient (patient_id)
);

select*from Billing;

insert into Billing
(billing_id ,patient_id,amount ,billing_date, payment_status)
values
(1,1,500.00,'2024-09-20','paid'),
(2,2,5000.00,'2024-03-21','pending'),
(3,3,2500.00,'2024-01-22','paid'),
(4,4,10000.00,'2024-02-02','pending'),
(5,5,20000.00,'2023-09-20','paid'),
(6,6,500000.00,'2022-10-19','pending');

select*
from Billing
where patient_id =1;

select*
from Billing
where payment_status = 'pending';

update Billing
set payment_status='paid'
where billing-id =6;

delete from Billing
where billing_id =6;

create table Inventory(
inventory_id int primary key,
item_name varchar (200) not null,
quantity int not null,
expiration_date date not null
);

select*from Inventory;

insert into Inventory
(inventory_id, item_name, quantity, expiration_date)
values
(121,'Syringes',200, '2025-01-20'),
(122,'Bendages',100, '2026-02-21'),
(123,'Gloves',500, '2028-03-22'),
(124,'Surgical Mask',1000, '2024-12-25'),
(125,'Gauze Pads',2000, '2027-05-24'),
(126,'Medical Tapes',5000, '2024-11-28');

select*
from Inventory
where quantity < 50;

select*
from Inventory
where expiration_date <= curdate() + interval 30 Day;

update Inventory
set quantity = 150
where inventory_id =1;

Delete	
from Inventory
where inventory_id =2;





