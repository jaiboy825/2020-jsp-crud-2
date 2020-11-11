<%@page import="book.BookVO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	String error = (String) request.getAttribute("error");
	if (error != null) {
		out.print("<script>alert('" + error + "'); history.go(-1);</script>");
	}

	String ok = (String) request.getAttribute("ok");

	if (ok != null) {
		out.print("<script>alert('" + ok + "'); location.href='/BookList.do'; </script>");
	}

	int bcode = Integer.parseInt(request.getParameter("bcode"));
	BookDAO dao = new BookDAO();
	BookVO vo = dao.findBook(bcode);

	if (vo != null) {
%>
<div>
	<form action="/BookUpdate.do" method="post">
		<table border="2">
			<tr>
				<td>도서코드</td>
				<td><input type="text" value="<%=vo.getBcode()%>" name="bcode"
					readonly></td>
			</tr>
			<tr>
				<td>도서제목</td>
				<td><input type="text" value="<%=vo.getBtitle()%>"
					name="btitle" id="btitle" required></td>
			</tr>
			<tr>
				<td>도서저자</td>
				<td><input type="text" value="<%=vo.getBwriter()%>"
					name="bwriter" id="bwriter" required></td>
			</tr>
			<tr>
				<td>출판사코드</td>
				<td><select name="bpub" required>
						<%
							if (vo.getBpub() == 1001) {
						%>
						<option value="1001" selected>양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
						<%
							} else if (vo.getBpub() == 1002) {
						%>
						<option value="1001">양영디지털</option>
						<option value="1002" selected>북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
						<%
							} else if (vo.getBpub() == 1003) {
						%>
						<option value="1001">양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003" selected>한빛아카데미</option>
						<option value="1004">이지스</option>
						<%
							} else if (vo.getBpub() == 1004) {
						%>
						<option value="1001">양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004" selected>이지스</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" value="<%=vo.getBprice()%>"
					name="bprice" id="bprice" required></td>
			</tr>
			<tr>
				<td>출간날짜</td>
				<td><input type="text" value="<%=vo.getBdate()%>" name="bdate"
					readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" id="add"><input
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
<%
	}
%>
<%@ include file="footer.jsp"%>