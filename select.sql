select * from student_tb;
# *의 의미는 전체 컬럼
# from -> where -> select 순서
# 컬럼들은 무조건 한줄에 하나씩

select
	student_id, 
	name,
    age
from
	student_tb 
where
	# not은 앞에 붙이자
	not name = '김준일'
    and name = '김준이';
    
select
	*
from
	student_tb
where
	# in 은 or 조건이랑 같다 (값이 안에 들어있다면 뽑아내라) 
	name in('김준일', '김준이');
    
select
	*
from
	student_tb
where
	student_id in (1,2,3);
    
    #student_tb 안에 값들 비우기
truncate table student_tb;

/*
	<10명의 학생 정보 추가>
    김도균 27 부산 금정구
    김도훈 25 부산 부산진구
    김범수 33 부산 부산진구
    김상현 26 부산 금정구
    이재영 26 부산 서구
    이정찬 29 부산 부산진구
    이지언 26 부산 동래구
    이편원 30 경상남도 양산시
    전주환 30 부산 부산진구
    심재원 29 부산 남구
*/

insert into
	student_tb
    (student_id, name, age, address)
values
	(0,'김도균', 27, '부산 금정구'),
	(0,'김도훈', 25, '부산 부산진구'),
	(0,'김범수', 33, '부산 금정구'),
	(0,'김상현', 26, '부산 남구'),
	(0,'이재영', 26, '부산 서구'),
	(0,'이정찬', 29, '부산 부산진구'),
	(0,'이지언', 26, '부산 동래구'),
	(0,'이평원', 30, '경상남도 양산시'),
	(0,'전주환', 30, '부산 부산진구'),
	(0,'심재원', 29, '부산 남구');
#전체 조회
select
	*
from
	student_tb;
    
/*
20대와 30대 나누기
*/
#20대 찾기
# age between a and b 은 이상/이하로 -> 날짜계산 할때 사용 
select
	*
from
	student_tb
where
	age between 20 and 30;
#30대
select
	*
from
	student_tb
where
	age >= 30
    and age <= 40;

# 와일드카드같은 개념
# 이름 중 김씨들만 뽑자 ->  name like '김%'; 하면 김씨들만 걸러내기 (% 또는 _ / _(언더바)는 꼭 자리(글자수)는 맞추기)
# % 글자 % -> 그 글자만 포함되면 출력
# 이%글자% -> 이로 시작하고 어떤 글자 가 포함된 것 출력
select
	*
from
	student_tb
where
	name like '%원%';
    
/*
중간에 '도' 있으면 출력
'원' 으로 끝나는 결과 출력하기
*/
select
	*
from
	student_tb
where
	name like '%도%'
    or name like '%원';
    
# <집계> (그룹화) GroupBy / from -> where(그룹 전 조건) -> group by(그룹화) -> having(그룹화 한걸 조건) -> select -> order by 순서
# count(*) 는 전체 개수 확인하기
# 주소가 같은 사람 개수 확인하기
# as(이름지어주기)
# having : 그룹을 묶고 나서 조건주기
# oder by(결과를 정렬하기) : 오름차순 <-> desc 붙이면 내림차순

select
	name,
	address,
	count(*) as address_count
from
	student_tb
group by
	address
having 
	#count(*) >= 2; 도 같은 값
	address_count >= 2
order by
	address_count desc,
    #숫자먼저 정렬 후 또다른 정렬하기
    address desc;
    