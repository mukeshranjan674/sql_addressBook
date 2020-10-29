#UC1
#Ability to create address book service database
create database address_book_service;
#Show Databases
show databases;

#UC2
#Ability to create a table address book inside the database
create table address_book
(
first_name varchar(80) not null,
last_name varchar(80) not null,
address varchar(150) not null,
city varchar(50) not null,
state varchar(50) not null,
zip varchar(6) not null,
phone varchar(10) not null,
email varchar(100) not null
);

#UC3
#Ability to insert contact details into the table
insert into address_book values
('mukesh', 'ranjan', 'sijua', 'dhanbad', 'jharkhand', '800800', '8989898989', 'm@gmail.com'),
('nitish', 'kumar', 'new town', 'greater noida', 'uttar pradesh', '100002', '8988898989', 'r@gmail.com'),
('dev', 'kumar', 'bilaspur', 'raipur', 'chhattisgarh', '402500', '8989895989', 'k@gmail.com');
#Show table
select * from address_book;

#UC4
#Ability to edit the existing person using name
update address_book set address = 'old town' where first_name = 'nitish' and last_name = 'kumar';