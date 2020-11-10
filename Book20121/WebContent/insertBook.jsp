<%@page import="book.BookDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	BookDAO dao = new BookDAO();
int bcode = dao.getMaxNo();
Date bdate = Date.valueOf(LocalDate.now());

String error = (String) request.getAttribute("error");
if (error != null) {
	out.print("<script>alert('" + error + "'); history.go(-1);</script>");
}

String ok = (String) request.getAttribute("ok");

if (ok != null) {
	out.print("<script>alert('" + ok + "'); location.href='/BookList.do'; </script>");
}
%>
<div>
	<form action="/BookInsert.do" method="post">
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
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" value="" name="bprice" id="bprice"
					required></td>
			</tr>
			<tr>
				<td>출간날짜</td>
				<td><input type="text" value="<%=bdate%>" name="bdate" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" id="add"><input
					type="reset" value="재작성"></td>
			</tr>
		</table>
		<script type="text/javascript">
		add.addEventListener("click", function() {
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
		});
	</script>
	</form>
</div>

<%@ include file="footer.jsp"%>