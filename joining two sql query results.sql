-- suppose table-A has id and name
-- table-b has id, aId that is the same as the id of table-b(should have used a foreign key here :v) and a status that is either 'sent' or 'unsent'
-- do a query where the results will be, id, count of sents and count of unsents


drop table TB_A;
drop table TB_B;


create table tb_a (
	id int primary key identity(1,1) not null,
	name varchar(50) not null
);


create table tb_b (
	id int primary key identity(1,1) not null,
	aId int not null,
	state_name varchar(50) not null
);


insert into tb_a values ('A');
insert into tb_a values ('B');


insert into tb_b values (1, 'sent');
insert into tb_b values (1, 'sent');
insert into tb_b values (1, 'unsent');
insert into tb_b values (2, 'sent');
insert into tb_b values (2, 'unsent');


select X.id, X.sent, Y.unsent from
(select tb_a.id, count(tb_a.id) as 'sent'
from tb_a 
inner join tb_b
on tb_a.id = tb_b.aId
where tb_b.state_name = 'sent'
group by tb_a.id) as X
inner join 
(select tb_a.id, count(tb_a.id) as unsent
from tb_a 
inner join tb_b
on tb_a.id = tb_b.aId
where tb_b.state_name = 'unsent'
group by tb_a.id) as Y
on X.id = Y.id
