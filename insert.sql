use `db_study`; #데이터 베이스 선택

#AI 체크하면 0을 연속으로 넣어도, 빈칸을 넣어도 순서대로 카운트가 된다
#NN 은 Not Null 로 필수기입란이어야한다

insert into student_tb(student_id, name, age, address) values (0, '김준일', 31, '부산 동래구');
insert into student_tb(address, name, age, student_id) values ('부산 동래구', '김준이', 31, 1);
insert into student_tb(name, address) values ('김준이', null);
insert into student_tb values (0, '김준삼', null, null);
insert into student_tb values (0, '김준삼', null, null), (0, '김준사', null, null);

insert into 
	student_tb
    (student_id, name, age, address)
values
	(0, '김준삼', null, null),
	(0, '김준사', null, null);