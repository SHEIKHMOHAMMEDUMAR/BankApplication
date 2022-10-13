use bankdb;
 
create table Users(userName varchar(30) unique, password varchar(32), primary key(userName));
insert into Users values('Umar','7829646279uU#');

select * from Users;

create table Accounts(Account_No bigint unique, 
userName varchar(30) unique,
account_Type enum('Savings','Current'),
gender enum('Male','Female'),
aadhar_No char(12),
pan_No char(10),
balance double,
phone_No bigint unique, 
address varchar(50),
primary key(userName),
foreign key(userName) references Users(userName));

select * from Accounts;

update Accounts set phone_No = 9538917402 where userName = 'Umar';

insert into Accounts values(5081711774877,
'Umar',
'Savings',
'Male',
'267890606992',
'KVKPS3108G',
1000,
9538917403,
'Kalaburagi');
insert into Accounts values(7303230512423,
'AnimeshT123',
'Savings',
'Male',
'750201151422',
'ZNVKP5506T',
1000,
8340622340,
'Bengaluru');

create table Transactions(Transactions_ID bigint,
Account_No bigint,
userName varchar(30),
Transaction_Type enum('Wd','De','Tr','Cr','EMI'),
date DATETIME DEFAULT CURRENT_TIMESTAMP,
Amount double,
balance double,
foreign key(userName) references Users(userName));

select * from Transactions;

create table creditUsers(userName varchar(30) unique, CardNo char(12), cvvNo char(3), creditBalance double, foreign key(userName) references Users(userName));

select * from creditUsers;