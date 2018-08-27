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
(08,'荣耀8','深海蓝',1899,'华为公司','2016年7月11日',300),
(010,'荣耀10','幻影紫',2499,'华为公司','2018年4月19日',600),
(18,'小米8','陶瓷白',3249,'小米公司','2018年5月31',400),
(01,'iPhoneX','土豪金',6999,'苹果公司','2017年9月13',100),
(520,'一加六','魅影黑',6499,'一加科技','2018年2月13',12)
go

select * from Phone

select * from Phone where name like '%i%'