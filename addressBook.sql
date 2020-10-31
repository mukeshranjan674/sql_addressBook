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
('krishna', 'kanahiya', 'dwarika', 'dwarika', 'gujrat', '700002', '8988898989', 'krishna@gmail.com', 'arjun', 'friend'),
('balram', 'kumar', 'mathura', 'mathura', 'uttar pradesh', '402500', '8989895989', 'balram@gmail.com', 'krihsna', 'friend');

#UC10
#Ability to get number of contact persons
select type, count(first_name) from address_book group by type;

#UC11
#Ability to add person to both Friend and Family
insert into address_book values
('balram', 'kumar', 'mathura', 'mathura', 'uttar pradesh', '402500', '8989895989', 'balram@gmail.com', 'krishna','family');
create table name
(
id INT unsigned NOT NULL,
first_name varchar(80) not null,
last_name varchar(80) not null,
foreign key(id) references address_book(id)
);

create table address
(
id INT unsigned NOT NULL,
city varchar(50) not null,
state varchar(50) not null,
zip varchar(6) not null,
primary key(id),
foreign key(id) references address_book(id)
);

create table address_book
(
id INT unsigned NOT NULL AUTO_INCREMENT,
phone varchar(10) not null,
email varchar(100) not null,
primary key(id)
);

insert into address_book values
(1,895,'laj');
insert into address values
(2,'daf', 'adf', 9856);

select * from address;

#Ability to extend employee_payroll_service to have basi_pay, deductions, taxable_pay and net_pay
ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;
use address_book_service;
show tables;

#UC12
#Ability to implement an entity-relationship model
drop table address_book;
create table address_book
(
book_id int unsigned not null,
name varchar(30) not null,
primary key(book_id)
);

create table person
(
book_id int unsigned not null,
contact_id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
primary key(contact_id),
foreign key(book_id) references address_book(book_id)
);

create table person_address
(
contact_id int not null,
address varchar(30) not null,
city varchar(20) not null,
state varchar(20) not null,
zip varchar(6),
primary key(contact_id),
foreign key(contact_id) references person(contact_id)
);

create table contact_details
(
contact_id int not null,
phone_no varchar(10) not null,
email varchar(30),
contact_type varchar(20),
foreign key(contact_id) references person(contact_id)
);

insert into address_book values
(100, 'book1'),
(101, 'book2');

insert into person values
(100, 111, 'Ram', 'Kumar'),
(100, 112, 'Shyam', 'Kumar'),
(100, 113, 'Krishna', 'Kumar');

insert into person_address values
(111, 'Street 1', 'dhanbad', 'jharkhand', '858585' ),
(112, 'Street 2', 'ranchi', 'jharkhand', '889895'),
(113, 'Street 3', 'jamshedpur', 'jharkhand', '789878');

insert into contact_details values
(111, '8989898989', 'ram@gmail.com', 'family'),
(112, '8989298989', 'shyam@gmail.com', 'family'),
(113, '8989798989', 'krishna@gmail.com', 'friend');

#UC13
#Ability to retrieve data as described in UC6, UC7, UC8 and UC10
select c.first_name, c.last_name, a.phone_no, a.email, a.contact_type, b.address, b.city, b.state, b.zip from 
contact_details a, person_address b, person c
where a.contact_id = c.contact_id and a.contact_id = b.contact_id and b.city = 'dhanbad';

select city, count(city) from person_address group by city;

select c.first_name, c.last_name, a.phone_no, a.email, a.contact_type, b.address, b.city, b.state, b.zip from 
contact_details a, person_address b, person c
where a.contact_id = c.contact_id and a.contact_id = b.contact_id order by c.first_name;

select contact_type, count(contact_type) from contact_details group by contact_type;