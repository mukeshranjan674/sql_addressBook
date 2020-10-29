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