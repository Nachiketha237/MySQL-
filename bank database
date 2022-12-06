#most importantly use on delete and on update cascade
show databases;
use bank_database;
show tables;

create database if not exists 1BM21CS123_bank;
use 1BM21CS123_bank;

create table branch(
	branch_name varchar(255) primary key,
	branch_city varchar(255) not null,
	assets float
);

create table bank_account(
	acc_num int primary key,
	branch_name varchar(255),
	balance float,
	foreign key (branch_name) references branch(branch_name)
);

create table bank_customer(
	customer_name varchar(255) primary key,
	customer_street varchar(255) not null,
	city varchar(255) not null
);


create table depositer(
	customer_name varchar(255),
	acc_num int,
	primary key (customer_name, acc_num),
	foreign key (acc_num) references bank_account (acc_num),
	foreign key (customer_name) references bank_customer (customer_name)
);

create table loan(
	loan_num int primary key,
	branch_name varchar(255),
	amount float,
	foreign key (branch_name) references branch (branch_name)
);

create table borrower(
	customer_name varchar(255),
	loan_num int,
	foreign key (customer_name) references bank_customer (customer_name),
	foreign key (loan_num) references loan (loan_num)
);

insert into branch values
  ("SBI_Chamrajpet", "Bangalore", 50000),
  ("SBI_ResidencyRoad", "Bangalore", 10000),
  ("SBI_ShivajiRoad", "Bombay", 20000),
  ("SBI_ParlimentRoad", "Delhi", 10000),
  ("SBI_Jantarmantar", "Delhi", 20000);
  
insert into bank_account values
  (1, "SBI_Chamrajpet", 2000),
  (2, "SBI_ResidencyRoad", 5000),
  (3, "SBI_ShivajiRoad", 6000),
  (4, "SBI_ParlimentRoad", 9000),
  (5, "SBI_Jantarmantar", 8000),
  (6, "SBI_ShivajiRoad", 4000),
  (8, "SBI_ResidencyRoad", 4000),
  (9, "SBI_ParlimentRoad", 3000),
  (10, "SBI_ResidencyRoad", 5000),
  (11, "SBI_Jantarmantar", 2000);

insert into bank_customer values
  ("Avinash", "Bull Temple Road", "Bangalore"),
  ("Dinesh", "Bannergatta Road", "Bangalore"),
  ("Mohan", "National College Road", "Bangalore"),
  ("Nikil", "Akbar Road", "Delhi"),
  ("Ravi", "Prithviraj Road", "Delhi");

insert into depositer values
  ("Avinash", 1),
  ("Dinesh", 2),
  ("Nikil", 4),
  ("Ravi", 5),
  ("Avinash", 8),
  ("Nikil", 9),
  ("Dinesh", 10),
  ("Nikil", 11);
  
insert into loan values
  (1, "SBI_Chamrajpet", 1000),
  (2, "SBI_ResidencyRoad", 2000),
  (3, "SBI_ShivajiRoad", 3000),
  (4, "SBI_ParlimentRoad", 4000),
  (5, "SBI_Jantarmantar", 5000);
  
  insert into branch values
	("SBI_MantriMarg", "Delhi", 200000);
	
insert into bank_account values
	(12, "SBI_MantriMarg", 2000);
	
insert into depositer values
	("Nikil", 12);
	
insert into borrower values
	("Avinash", 1),
	("Dinesh", 2),
	("Mohan", 3),
	("Nikil", 4),
	("Ravi", 5);
    
show tables;

select customername
from depositer
where  (select accno
from bankaccount
where branchname = (select branchname
from branch
where branchcity = 'Delhi') );

#Q1
select customer_name
from bank_account ba, depositer d
where branch_name in (select branch_name from branch
where branch_city = "Delhi") and ba.acc_num = d.acc_num
group by customer_name
having count(distinct branch_name) = (select count(branch_name) from branch
where branch_city = "Delhi");

#Q2
select customer_name from borrower
where customer_name not in (select distinct(customer_name) from depositer);

#Q3
select customer_name from borrower
where customer_name in (select distinct(customer_name) from depositer);

#Q4
select * from branch
where assets > (select max(assets) from branch
where branch_city = "Bangalore");

#Q5
delete from bank_account
where branch_name in (select branch_name
from branch
where branch_city = "Bombay");
    
select * from bank_account;

#Q6
update bank_account
set balance = balance*1.05;

select * from bank_account;
