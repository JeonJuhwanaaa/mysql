# Navy 를 Green 으로 바꿔라 
# 순서 update -> where -> set
# set = from 테이블
update product_color_tb
set product_color_name = 'Green'
where
	product_color_name = 'Navy';
    
    #하나씩 넣기
update product_color_tb
set
	product_color_name_kor = '블랙'
where
	product_color_name = 'Black';
update product_color_tb
set
    product_color_name_kor = '화이트'
where
    product_color_name = 'White';

update product_color_tb
set
    product_color_name_kor = '그린'
where
    product_color_name = 'Green';
    
    #전체 한번에 값 넣기
    #case when then else end = if문
update product_color_tb
set
	product_color_name_kor = case
		when product_color_name = 'Black' then '블랙'
		when product_color_name = 'White' then '화이트'
		when product_color_name = 'Green' then '그린'
    end;
    
    
    
    
    