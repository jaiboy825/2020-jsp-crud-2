<%@page import="book.BookDAO"%> <!-- BookDAO를 import -->
<%@page import="java.time.LocalDate"%> <!-- java 안에 time에 LocalDate를 import -->
<%@page import="java.sql.Date"%> <!-- java안에 sql에서 사용하는 Date를 import한다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	BookDAO dao = new BookDAO();
	/* BookDAO를 가져와서 dao로 지정 */
int bcode = dao.getMaxNo();
	/* bcode는 자동 생성되며 마지막 번호 + 1을 위해 dao에 만들어둔 getMaxNo를 이용해서 값을 가져온다 */
Date bdate = Date.valueOf(LocalDate.now());
	/* 날짜는 처음에는 그냥 그날 날짜로 설정 하기 위해서 오늘 날짜를 가져온다 */
String error = (String) request.getAttribute("error");
	/* BookUpdateController에서 error를 받아온다 */
if (error != null) {
	/* error가 null이 아니라면 error 메시지를 alert창에 띄운다 */
	out.print("<script>alert('" + error + "');</script>");
}

String ok = (String) request.getAttribute("ok");
/* BookUpdateController에서 ok를 받아온다 */
if (ok != null) {
	/* ok가 null이 아니라면 ok 메시지를 alert창에 띄우고 BookList.do 로 보낸다*/
	out.print("<script>alert('" + ok + "'); location.href='/BookList.do'; </script>");
}
%>
<div>
	<form action="/BookInsert.do" method="post">
	<!-- 등록하기 위해서 받은 값들은 BookInsert.do(BookInsertController)로 post한다 -->
		<table border="2">
			<tr>
				<td>도서코드</td>
				<td><input type="text" value="<%=bcode%>" name="bcode" readonly></td>
			</tr>
			<tr>
				<td>도서제목</td>
				<td><input type="text" value="" name="btitle" id="btitle"
					required></td>
			</tr>
			<tr>
				<td>도서저자</td>
				<td><input type="text" value="" name="bwriter" id="bwriter"
					required></td>
			</tr>
			<tr>
				<td>출판사코드</td>
				<td><select name="bpub" required>
						<option value="1001">양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
						<!-- 표현을 출판사 이름으로 하지만 입력은 코드로 받기에 value값을 출판사 코드로 한다 -->
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" value="" name="bprice" id="bprice"
					required></td>
			</tr>
			<tr>
				<td>출간날짜</td>
				<td><input type="date" value="<%=bdate%>" name="bdate" id="bdate" required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" id="add"><input
					type="reset" value="재작성"></td>
			</tr>
		</table>
		<script type="text/javascript">
		add.addEventListener("click", function() {
		/* 혹시나 alert 창이 안나온다면 chrome에서 실행 해보세용 */
		/* 등록버튼을 눌렀을때 */
			if (btitle.value.trim() == "") {
				alert("책 제목이 입력되지 않았습니다.");
				return
			}
			if (bwriter.value.trim() == "") {
				alert("책 작가가 입력되지 않았습니다.");
				return
			}
			if (bprice.value.trim() == "") {
				alert("책 금액이 입력되지 않았습니다.");
				return
			}
			if (bdate.value.trim() == "") {
				alert("출간날짜가 입력되지 않았습니다.");
				return
			}
			/* 각 input의 value값에 공백을 없앤 값이 "" 이라면 alert창에 띄운다 */
		});
	</script>
	</form>
</div>

<%@ include file="footer.jsp"%>