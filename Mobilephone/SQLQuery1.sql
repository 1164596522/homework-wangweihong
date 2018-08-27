use master
go

create database mobilephoneDB
go

use mobilephoneDB
go

create table Phone
(
	id int primary key,
    name nvarchar(10) not null,
    colour nvarchar(8) not null,
    price money not null,
	company nvarchar(12) not null,
    timetomarket nvarchar(10) not null,
    inventory int check(inventory>=0),
)
go

insert into Phone values
(08,'��ҫ8','���',1899,'��Ϊ��˾','2016��7��11��',300),
(010,'��ҫ10','��Ӱ��',2499,'��Ϊ��˾','2018��4��19��',600),
(18,'С��8','�մɰ�',3249,'С�׹�˾','2018��5��31',400),
(01,'iPhoneX','������',6999,'ƻ����˾','2017��9��13',100),
(520,'һ����','��Ӱ��',6499,'һ�ӿƼ�','2018��2��13',12)
go

select * from Phone

select * from Phone where name like '%i%'