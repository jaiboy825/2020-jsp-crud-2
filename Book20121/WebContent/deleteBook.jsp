<%@page import="book.BookVO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<%
	int bcode = Integer.parseInt(request.getParameter("bcode"));

	String error = (String) request.getAttribute("error");
	if (error != null) {
		out.print("<script>alert('" + error + "'); location.href='/BookList.do';</script>");
	}
	String ok = (String) request.getAttribute("ok");
	if (ok != null) {
		out.print("<script>alert('" + ok + "'); location.href='/BookList.do'; </script>");
	}
%>

<script>
	let result = confirm("정말 삭제하시겠습니까?");
	if(result) {
		location.href = '/BookDelete.do?bcode=<%=bcode%>';
	} else {
		history.back();
	}
</script>

<%@ include file="footer.jsp"%>