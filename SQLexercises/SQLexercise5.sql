--Matthew Story
--SQl exercise 5

.echo on
.headers on

--1.
create table pres(
first text,
middle,test
last text,
born text,
died text,
start text,
end text,
party text,
home text);


.schema 

.mode csv pres
.import presidents-v2.csv pres 

select * from pres 

--2.
delete from pres where first like first;

--3.
 alter table pres add id integer primary key not null unique autoincrement;
 
 create table presidents (
 id integer primary key  autoincrement.
 first text,
 last text,
 born text,
 died text,
 start text,
 end text,
 party text, 
 home text);
 
 insert into preidents (select(first, middle, last, born, died, start, end, party, home from pres);

 
