select
	bt.book_id,
    bt.book_name,
    bt.author_id,
	at.author_name,
    bt.publisher_id,
    pt.publisher_name
from
	book_tb bt
    left outer join author_tb at on(bt.author_id = at.author_id)
    left outer join publisher_tb pt on(bt.publisher_id = pt.publisher_id)
where
	bt.book_name like '%수%';