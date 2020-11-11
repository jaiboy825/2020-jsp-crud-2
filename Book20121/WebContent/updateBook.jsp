<%@page import="book.BookVO"%> <!-- BookVO 임포트 -->
<%@page import="book.BookDAO"%><!-- BookDAO 임포트 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	String error = (String) request.getAttribute("error");
	/* BookUpdateController에서 보낸 error */
	if (error != null) {
		/* error가 null이 아니라면 error메시지를 보여준다 */
		out.print("<script>alert('" + error + "'); history.go(-1);</script>");
	}

	String ok = (String) request.getAttribute("ok");
	/* BookUpdateController에서 보낸 ok */
	if (ok != null) {
		/* ok가 null이 아니라면 ok메시지를 보여주고 BookList.do로 이동 */
		out.print("<script>alert('" + ok + "'); location.href='/BookList.do'; </script>");
	}

	int bcode = Integer.parseInt(request.getParameter("bcode"));
	/* selectBook에서 table의 a태그에서 이동되면서 보내진 bcode를 받는다 */
	BookDAO dao = new BookDAO();
	/* BookDAO를 부르고 dao라고 지정 */
	BookVO vo = dao.findBook(bcode);
	/* update할 유저를 찾기위해 dao에 있는 findBook으로 업데이트할 유저의 정보를 vo형식으로 받아온다 */

	if (vo != null) {
		/* vo가 null이 아니라면 */
%>
<div>
	<form action="/BookUpdate.do" method="post">
	<!-- 입력된 값들은 update하기 위해 BookUpdate.do(BookUpdateController)로 post한다 -->
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
								/* 가져온 bpub값이 1001이라면 양영디지털을 select */
						%>
						<option value="1001" selected>양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
						<%
							} else if (vo.getBpub() == 1002) {
								/* 가져온 bpub값이 1002라면 북스미디어를 select */
						%>
						<option value="1001">양영디지털</option>
						<option value="1002" selected>북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
						<%
							} else if (vo.getBpub() == 1003) {
								/* 가져온 bpub값이 1003이라면 한빛아카데미를 select */
						%>
						<option value="1001">양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003" selected>한빛아카데미</option>
						<option value="1004">이지스</option>
						<%
							} else if (vo.getBpub() == 1004) {
								/* 가져온 bpub값이 1004라면 이지스를 select한다 */
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
				<td><input type="date" value="<%=vo.getBdate()%>" name="bdate"
					id="bdate" required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" id="add"><input
					type="reset" value="재작성"></td>
			</tr>
		</table>
		<script type="text/javascript">
		add.addEventListener("click", function() {
			/* script가 제대로 작동이 안된다면 chrome에서 실행해보세요. */
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
			/* update할 값들의 input창의 value에서 공백을 지운값이 ""이라면 alert으로 띄운다 */
		});
	</script>
	</form>
</div>
<%
	}
%>
<%@ include file="footer.jsp"%>