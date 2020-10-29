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

#UC5
#Ability to delete a person using first and last name
delete from address_book where first_name = 'nitish' and last_name = 'kumar';

#UC6
#Ability to retrieve a contact person using name of city
select * from address_book where city = 'dhanbad';
#Ability to retrieve a contact person using name of state
select * from address_book where state = 'jharkhand';

#UC7
#Ability to get the size of the table address_book by city or state
select city, count(city) from address_book group by city;
select state, count(state) from address_book group by state;

#UC8
#Ability to retrieve entries sorted alphabetically by Person’s name for a given city
insert into address_book values
('akash', 'sharma', 'greater sijua', 'dhanbad', 'jharkhand', '800800', '8989898989', 'mr@gmail.com');
select * from address_book where city = 'dhanbad' order by first_name;

#UC9
#Ability to identify each Address Book with name and type
alter table address_book add name VARCHAR(80);
alter table address_book add type VARCHAR(80) default 'friend';
insert into address_book values
('shri', 'ram', 'ayodhya', 'ayodhya', 'ayodhya', '800800', '8989898989', 'ram@gmail.com', 'sugriv','friend'),
('krishna', 'kanahiya', 'dwarika', 'dwarika', 'gujrat', '700002', '8988898989', 'krishna@gmail.com', 'arjun', 'disciple'),
('balram', 'kumar', 'mathura', 'mathura', 'uttar pradesh', '402500', '8989895989', 'balram@gmail.com', 'krihsna', 'brother');