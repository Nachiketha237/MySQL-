create database if not exists Supplier_database;
use Supplier_database;

-- creating Supplier table --
create table Supplier(
 sid int,
 sname varchar(30),
 city varchar(30),
 primary key(sid)
) 
select * from Supplier;

-- creating parts table --
create table parts(
 pid int,
 pname varchar(30),
 color varchar(30),
 primary key(pid)
)
select * from parts;

-- creating Catalog table--
create table Catalog(
 sid int,
 pid int,
 cost int,
 foreign key(pid) references parts(pid),
 foreign key(sid) references Supplier(sid)
 on delete cascade on update cascade
)
select * from Catalog;

-- inserting into Supplier table --
insert into Supplier 
values('10001','Eren Yeager','Bangalore'),
	  ('10002','Levi Ackerman','Kolkatta'),
      ('10003','Tenzen Uzui','Mumbai'),
      ('10004','Erwin Smith','Delhi'),
      ('10005','Rengoku Kyojuro','Chennai');
select * from Supplier;

-- inserting into parts table --
insert into parts
values('20001','Book','Red'),
	  ('20002','Pen','Red'),
      ('20003','Pencil','Green'),
      ('20004','Mobile','Green'),
      ('20005','Charger','Black'),
	  ('20006','Eraser','White');
select * from parts;

-- inserting into Catalog table --
insert into Catalog 
values ('10001','20001','30'),
       ('10001','20002','10'),
       ('10001','20003','10'),
       ('10001','20004','50'),
       ('10001','20005','20'),
       ('10002','20004','50'),
       ('10002','20002','15'),
       ('10003','20003','10'),
       ('10004','20003','15');
select * from Catalog;
 


--     week 7 todo queries   --

 #todo 3:
 
 select distinct(pname)
 from parts 
 where pid=some(select pid 
			    from Catalog);
 
 #todo 4:
  -- before running query delete a tuple from table parts so that query gives output --
--   delete from parts  --
--   where pid='20006';  --
  
  select distinct(sname)
  from supplier s
  where  not exists(select p.pid
					from parts p
					where not exists(select c.*
                                     from Catalog c
                                     where c.sid=s.sid and p.pid=c.pid));
                               
#todo 5:

select distinct(sname)
  from supplier s
  where  not exists(select p.pid,p.color
					from parts p
					where not exists(select c.*
                                     from Catalog c
                                     where c.sid=s.sid and p.pid=c.pid )and p.color='Red');
                                     
                                     
#tod0 6:
select  pname
from parts 
where pid in(select pid
			from Catalog 
            where sid in(select sid 
						  from supplier
                          where sname="Eren Yeager"))
	and pid not in(select pid
			from Catalog 
            where sid in(select sid 
						  from supplier
                          where sname!="Eren Yeager"));
                                     
#todo 7:
 select s.sid,s.sname
 from Supplier s,Catalog c
 where c.sid=s.sid and c.cost>(select avg(c1.cost)
							   from Catalog c1
                               where c.pid=c1.pid
                               group by c1.pid);




           
           
#todo 8:
select s.sid,s.sname
 from Supplier s,Catalog c
 where c.sid=s.sid and c.cost=(select max(c1.cost)
							   from Catalog c1
                               where c.pid=c1.pid
                               group by c1.pid);
