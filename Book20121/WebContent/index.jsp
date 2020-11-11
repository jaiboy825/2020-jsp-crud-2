<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div>
<p>도서 등록 프로젝트로 데이터 베이스를 구축하고 도서 등록 및 조회 프로그램을 작성합니다</p>


프로그램작성순서<br>
1.도서정보 테이블을 생성한다.<br>
2.도서 정보 테이블에 제시된 샘플 데이터를 추가 생성한다.<br>
3.도서 등록/화면 프로그램을 작성한다.<br>
4.도서 조회/수정 프로그램을 작성한다.<br>
5.도서 삭제 프로그램을 작성한다.<br>
</div>
<!-- 먼저 실행하기 전에 severs에 톰캣 modules에 들어가서 서버의 Path를 '/'로 바꿔준다 -->
<!-- 기능 만들었던 순서대로 -->
<!-- insert 구조 -->
<!-- 먼저 입력 형식이 있는 insertBook.jsp 에 가서 보여주고  입력을 받으면 BookInsertController로 보내진다 /BookInsert.do라는 주소로-->
<!-- BookInsertController에 있는 doProcess에서 처리되며 받은 값들을 vo 형식으로 만든 뒤 dao에 있는 insertBoard라는 곳으로 보내고 리턴을 받는다.-->
<!-- 받은 값이 0보다 크다면 성공이므로 ok라는 메시지를 아니라면 error라는 메시지를 다시 insertBook.jsp로 보내고  insertBook.jsp에서 이에 맞게 이동 시킨다.-->
<!-- 성공 = BookList.do(도서 목록 페이지) 실패 = 다시 insert 폼 나오게 된다 -->
<!------------------------------------------------------------------>
<!-- list 구조 -->
<!-- 먼저 바로 selectBook.jsp로 보내는것이 아니고 BookListController로 보내는 것이다 /BookList.do라는 주소로 -->
<!-- BookListController에 있는 doProcess에서 처리되며 dao에 있는 getList를 사용해서 리스트를 만든다 -->
<!-- 만들어진 리스트를 request에 "list"라는 이름에 list를 저장 하며 selectBook.jsp 로 보낸다 -->
<!-- selectBook.jsp에서는  list를 getAttribute로 받고 list를 for문으로 돌아서 각각의 데이터를 출력해준다 -->
<!-- bpub 데이터 같은 경우에는 값에 따라 출판사 이름이 바뀌기 때문에 switch를 사용해서 출력해줬고 -->
<!-- 가격은 3자리마다 콤마를 찍기위해 DecimalFormat함수를 사용해서 출력 -->
<!-- 날짜 형식은 yyyy년MM월dd일 이라는 형식으로 보여주기 위해서 SimpleDateFormat함수를 사용해서 바꿔줬당 -->
<!------------------------------------------------------------------>
<!-- update 구조 -->
<!-- 먼저 updateBook.jsp?bcode=수정할 책의 bcode로 이동한다 -->
<!-- updateBook.jsp에서 BookUpdateController로 bcode를 보낸다. /BookUpdate -->
<!-- BookUpdateController로  -->






<%@ include file="footer.jsp"%>