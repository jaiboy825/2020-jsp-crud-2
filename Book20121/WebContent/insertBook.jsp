<%@page import="book.BookDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	BookDAO instance = BookDAO.getInstance();
	int bcode = instance.getMaxNo();
	Date bdate = Date.valueOf(LocalDate.now());
%>
<div>
	<form action="BookInsert" method="post">
		<table border="2">
			<tr>
				<td>도서코드</td>
				<td><input type="text" value="<%=bcode%>" name="bcode" readonly></td>
			</tr>
			<tr>
				<td>도서제목</td>
				<td><input type="text" value="" name="btitle"></td>
			</tr>
			<tr>
				<td>도서저자</td>
				<td><input type="text" value="" name="bwriter"></td>
			</tr>
			<tr>
				<td>출판사코드</td>
				<td><select name="bpub" >
						<option value="1001">양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" value="" name="bprice"></td>
			</tr>
			<tr>
				<td>출간날짜</td>
				<td><input type="text" value="<%=bdate %>" name="bdate" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"><input type="reset" value="재작성"></td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="footer.jsp"%>