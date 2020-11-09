create table book_tbl (
	bcode NUMBER(5) NOT NULL PRIMARY KEY,
	btitle VARCHAR2(30),
	bwriter VARCHAR2(30),
	bpub NUMBER(4),
	bprice NUMBER(10) not null,
	bdate DATE
);

INSERT INTO BOOK_TBL VALUES(10100, '자바킹', '강길동', 1001, 12000, '20201102');
INSERT INTO BOOK_TBL VALUES(10101, '알고리듬', '남길동', 1002, 18000, '20200505');
INSERT INTO BOOK_TBL VALUES(10102, '스프링두', '서길동', 1003, 23000, '20190803');
INSERT INTO BOOK_TBL VALUES(10103, '파이썬', '홍길동', 1004, 9000, '20191011');

SELECT * FROM BOOK_TBL;

DROP TABLE BOOK_TBL;

