#SQL은 카멜표기법 xx
#동시에 insert 일어나는 과정

#변수 값 선언
set @book_name = '혼자 공부하는 SQL';
set @author = '우재남';
set @publisher = '한빛미디어';
set @new_author_id = 0;
set @new_publisher_id = 0;

insert into author_tb
values (0, @author);

# author_id 에서 제일 큰 값 가져오기
select 
	MAX(author_id) into @new_author_id
from 
	author_tb;
#확인
select @new_author_id;

insert into publisher_tb
values (0, @publisher);

# publisher_id 에서 제일 큰 값 가져오기
select 
	MAX(publisher_id) into @new_publisher_id
from 
	publisher_tb;
#확인
select @new_publisher_id;

insert into book_tb
values (0, @book_name, @new_author_id, @new_publisher_id);

select
	*
from
	book_tb
order by
	book_id desc;