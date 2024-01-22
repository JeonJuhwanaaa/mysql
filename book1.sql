# author_tb에 select한 값 그대로 넣기
insert into author_tb
SELECT
	0,
	author
FROM
	temp_book_tb
group by
	author
order by
	author;
    
select
	*
from
	author_tb;

# publisher_tb에 select한 값 그대로 넣기
insert into publisher_tb
SELECT
	0,
	publisher
FROM
	temp_book_tb
group by
	publisher
order by
	publisher;
    
select
	*
from
	publisher_tb;

# book_tb 에 select값 그대로 넣기
insert into book_tb
SELECT
	0,
	tbt.book_name,
    aut.author_id,
    pt.publisher_id
#tbt를 마스터로(기준으로) aut 테이블 name 과 tbt author 가 같은걸 보여줘라
FROM
	temp_book_tb tbt
	left outer join author_tb aut on (aut.author_name = tbt.author)
	left outer join publisher_tb pt on (pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    aut.author_id,
    pt.publisher_id
order by
	book_name,
    author_id,
    publisher_id;
    
select
	*
from
	book_tb;

# temp_book_tb(중복이 있는 임시 북테이블) 을 없애고 정규화한 모든 테이블을 붙이기위해
insert into book_register_tb
select
	0,
    tbt.book_code,
    bt2.book_id,
    tbt.loans_count
from
	temp_book_tb tbt 
    #join안에 또 하나의 테이블(bt2)로 넣기
    #커서 지정하고 실행 -> Ctrl+Shift+Enter
    left outer join (select
						bt.book_id,
						bt.book_name,
                        aut.author_name,
                        pt.publisher_name
					from
						book_tb bt
                        left outer join author_tb aut on (aut.author_id = bt.author_id)
                        left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)) bt2
on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher)


                        
                        
                        