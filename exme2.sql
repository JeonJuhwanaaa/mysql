insert into
	student_tb
values
	(0, '김춘식'),
	(0, '손흥민');
    
insert into
	subject_tb
values
	(0, '컴퓨터구조'),
	(0, '데이터베이스'),
    (0, '인공지능');
    
insert into
	score_tb
values
	(0, 1, 1, 95),
	(0, 2, 1, 84),
    (0, 1, 2, 89),
    (0, 2, 2, 92),
    (0, 1, 3, 100),
    (0, 2, 3, 88);
    
select
	sct.score_id,
    st.student_id,
    st.student_name,
    sjt.subject_id,
    sjt.subject_name,
    sct.score_num
from
	score_tb sct
    left outer join student_tb st on (st.student_id = sct.student_id)
    left outer join subject_tb sjt on (sjt.subject_id = sct.subject_id)
where
	score_id < 5;