# 우선 select는 * 해놓고 from 먼저 작성 후 생각하기
# rank 컬럼 하나 추가 후 rank() over(order by 정렬기준) 함수 사용해서 순위매기기
# partition by (select를 할 때 하나의 컬럼안에서 그룹묶기) 사용해서 출반사별 순위를 매기기
# row_number() over() - 모든 행의 번호를 고유하게 순차적으로 지정할 때 사용
# rank() over() - 순위 동률을 매길 때 사용

select
	*
# 서브쿼리 했을 땐 무조건 as 해주기
# temp_book_register_tb 로 또 하나의 테이블 만들기
from
	(select
		rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num,
		row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num,
		brt.book_id,
		bt.book_name,
		bt.author_id,
		aut.author_name,
		bt.publisher_id,
		pt.publisher_name,
		sum(brt.loans_count) as total_loans_count
	# 모든 정규화한 테이블을 하나로 묶기
	from
		book_register_tb brt
		left outer join book_tb bt on (bt.book_id = brt.book_id)
		left outer join author_tb aut on (aut.author_id = bt.author_id)
		left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
	# 중복제거
	group by
		brt.book_id,
		bt.author_id,
		bt.publisher_id) temp_book_register_tb
where
	row_num = 1;
