insert into
	product_tb
values
	(0, '딸기사탕', 50),
	(0, '누룽지사탕', 100);
    
start transaction;

insert into
	product_tb
values
	(0, '오렌지사탕', 20);

savepoint sp1;

update product_tb
set product_stock = 200
where
	product_code = 2;

rollback to savepoint sp1;

update product_tb
set product_stock = 200
where
	product_code = 1;

commit;

select
	*
from
	product_tb;
    
truncate table product_tb;