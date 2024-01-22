# from에서 사용하는 서브쿼리 
select
	aut.num,
    aut.author_name
from
	(select 
		row_number() over(order by author_id desc) as num,
		author_id,
        author_name
    from
		author_tb
	where
     author_name like '글%') aut
     
where
	num > 10;

#publisher_tb 옆에 원하는 숫자 붙이기 1번 방법)
select
	*,
    (select
		count(*)
        from
			publisher_tb) as total_count,
	67
from
	publisher_tb;
    
#publisher_tb 옆에 원하는 숫자 붙이기 2번 방법) -- 웬만하면 이 방법으로 쓰자(데이터가 많든 적든 최대한 컬럼에는 쓰지않는게 맞다)
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count from publisher_tb) pt2 on(1 = 1);
    
#where 조건식에도 subquary 사용 가능
# 1번 방법 - 데이터가 많지 않을 때 좋다
select
	*
from
	book_tb
where
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%');

# 2번 방법
select
	*
from
	book_tb bt
	left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';
    
# 내 쿼리 실행속도확인
select @@profiling;
show profiles;
set profiling = 1;