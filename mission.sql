insert into
	student_tb
    (student_id, name, age, address, address_sido, address_sigungu)
values
	(0,'김도균', 27, '부산 금정구', 1, 1),
	(0,'김도훈', 25, '부산 부산진구', 1, 2),
	(0,'김범수', 33, '부산 금정구', 1, 1),
	(0,'김상현', 26, '부산 남구', 1, 3),
	(0,'이재영', 26, '부산 서구', 1, 4),
	(0,'이정찬', 29, '부산 부산진구', 1, 2),
	(0,'이지언', 26, '부산 동래구', 1, 5),
	(0,'이평원', 30, '경상남도 양산시', 2, 6),
	(0,'전주환', 30, '부산 부산진구', 1, 2),
	(0,'심재원', 29, '부산 남구', 1, 3);

insert into address_sido_tb
values
	(0, 1, 1),
	(0, 2, 2);
    
insert into address_sigungu_tb
value
	(0, 1, '금정구'),
	(0, 1, '부산진구'),
	(0, 1, '남구'),
	(0, 1, '서구'),
	(0, 1, '동래구'),
	(0, 2, '양산시');
    
insert into address_register_tb
values
	(0, 1, 1),
	(0, 1, 2),
	(0, 1, 3),
	(0, 1, 4),
	(0, 1, 5),
	(0, 2, 6);
    
truncate table student_tb;
    
select
	*
from
	student_tb;
        
