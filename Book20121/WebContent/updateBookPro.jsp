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
%>

<div></div>
<%@ include file="footer.jsp"%>