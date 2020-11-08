create table book_tbl (
	bcode number(5) primary key not null,
	btitle varchar2(30),
	bwriter varchar2(30),
	bpub number(4),
	bprice number(10) not null,
	bdate date
)
insert into book_tbl values(10100, '자바킹', '강길동', 1001, 12000, '20201102');
insert into book_tbl values(10101, '알고리듬', '남길동', 1002, 18000, '20200505');
insert into book_tbl values(10102, '스프링두', '서길동', 1003, 23000, '20190803');
insert into book_tbl values(10103, '파이썬', '홍길동', 1004, 9000, to_date()'20191011');

select * from book_tbl;