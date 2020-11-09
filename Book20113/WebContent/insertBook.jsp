<%@page import="book.BookDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<%
	Date date = Date.valueOf(LocalDate.now());

	BookDAO dao = BookDAO.getInstance();
%>

<form action="/BookInsertController" method="POST">
	<table border="2" style="text-align: center;">
		<tr>
			<td>도서코드</td>
			<td><input type="text" value="<%= dao.bCodeMax()%>" readonly></td>
		</tr>

		<tr>
			<td>도서제목</td>
			<td><input type="text"></td>
		</tr>

		<tr>
			<td>도서저자</td>
			<td><input type="text"></td>
		</tr>

		<tr>
			<td>출판사코드</td>
			<td>
				<select name="bpub" id="bpub">
					<option value="">양영디지털</option>
					<option value="">북스미디어</option>
					<option value="">한빛아카데미</option>
					<option value="">이지스</option>
				</select>
			</td>
		</tr>

		<tr>
			<td>가격</td>
			<td><input type="text"></td>
		</tr>

		<tr>
			<td>출간날짜</td>
			<td><input type="text" value="<%=date%>" readonly></td>
		</tr>

		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="reset" value="재작성">
			</td>
		</tr>
	</table>
</form>

<%@ include file="footer.jsp"%>