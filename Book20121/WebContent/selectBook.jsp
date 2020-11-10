<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="book.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");
String pub = "";
%>
<style>
.container>table {
	text-align: center;
}
</style>
<section>
	<div class="container">
		<table border="2" width="100%">
			<tr>
				<th>도서코드</th>
				<th>도서제목</th>
				<th>도서저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>출간날짜</th>
				<th>삭제</th>
			</tr>
			<%
				if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					BookVO vo = new BookVO();
					vo = list.get(i);
			%>
			<tr>
				<td><a href="/updateBook.jsp?bcode=<%=vo.getBcode()%>"><%=vo.getBcode()%></a></td>
				<td><%=vo.getBtitle()%></td>
				<td><%=vo.getBwriter()%></td>
				<%
					switch (vo.getBpub()) {
				case 1001:
					pub = "양영디지털";
					break;
				case 1002:
					pub = "북스미디어";
					break;
				case 1003:
					pub = "한빛아카데미";
					break;
				case 1004:
					pub = "이지스";
					break;
				}
				%>
				<td><%=pub%></td>
				<%
					int bprice = vo.getBprice();
				DecimalFormat df = new DecimalFormat("###,###");
				String price = df.format(bprice);
				%>
				<td><%=price%></td>
				<%
					Date bdate = vo.getBdate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
				String date = sdf.format(bdate);
				%>
				<td><%=date%></td>
				<td><a href="/BookDelete.do?bcode=<%=vo.getBcode()%>">삭제</a></td>
			</tr>
			<%
				}
			}
			%>
		</table>

	</div>

	<%@ include file="footer.jsp"%>