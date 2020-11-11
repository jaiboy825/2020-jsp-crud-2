create table book_tbl (
	bcode number(5) primary key not null,
	btitle varchar2(30),
	bwriter varchar2(30),
	bpub number(4),
	bprice number(10) not null,
	bdate date
)
-- book_tbl이라는 테이블을 만든다 
-- bcode는 number5로 5자리 숫자를 받을수 있고 primary 키라서 중복이 안된다
-- 그리고 not null이라서 null값이 들어가면 안된다
-- btitle은 제목
-- bwriter는 저자
-- bpub은 책의 출판사
-- bprice는 책의 가격이며 not null로 null값이 들어가면 안된다
-- bdate 는 말그대로 날짜이다
insert into book_tbl values(10100, '자바킹', '강길동', 1001, 12000, '20201102');
insert into book_tbl values(10101, '알고리듬', '남길동', 1002, 18000, '20200505');
insert into book_tbl values(10102, '스프링두', '서길동', 1003, 23000, '20190803');
insert into book_tbl values(10103, '파이썬', '홍길동', 1004, 9000, '20191011');

select * from book_tbl;

--drop table book_tbl;