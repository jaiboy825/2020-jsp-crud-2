<%@page import="book.BookVO"%> <!-- BookVO를 import -->
<%@page import="book.BookDAO"%> <!-- BookDAO를 import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- page Encoding을 utf-8로 한다 -->
<%@ include file="header.jsp"%>
<!-- header.jsp 를 include한다 -->

<%
	int bcode = Integer.parseInt(request.getParameter("bcode"));
	/* deleteBook.jsp?bcode=책번호로 보내졌을때 그 책 번호를 받는다 */
	String error = (String) request.getAttribute("error");
	/* BookDeleteController에서 error메시지를 받는다 */
	if (error != null) {
	/* error가 null이 아니라면 */
		out.print("<script>alert('" + error + "'); location.href='/BookList.do';</script>");
	/* error를 alert창으로 보여주고 /BookList.do로 이동한다 */
	}
	String ok = (String) request.getAttribute("ok");
	/* BookDeleteController에서 ok메시지를 받는다 */
	if (ok != null) {
	/* ok가 null이 아니라면 */
		out.print("<script>alert('" + ok + "'); location.href='/BookList.do'; </script>");
	/* ok를 alert창으로 보여주고 /BookList.do로 이동한다 */
	}
%>

<script>
	
	let result = confirm("정말 삭제하시겠습니까?");
	/* confirm 창 : alert와 비슷하지만 확인 취소 값을 받는다 */
	if(result) {
	/* result가 있다면 */
		location.href = '/BookDelete.do?bcode=<%=bcode%>';
	/*/BookDelete.do 로 bcode를 보낸다 */
	} else {
	/* 아니라면  */
		history.back();
	/* deleteBook.jsp 이전 페이지인 BookList.do로 이동 */
	}
</script>

<%@ include file="footer.jsp"%>