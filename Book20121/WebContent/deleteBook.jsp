<%@page import="book.BookVO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<%
	int bcode = (Integer) request.getAttribute("bcode");
%>
<script type="text/javascript">
	var result = confirm("정말 삭제하시겠습니까?");
	if (result == true) {
	} else if (result == false) {
		location.href = "/index.jsp"
	}
</script>
<div></div>
<%@ include file="footer.jsp"%>