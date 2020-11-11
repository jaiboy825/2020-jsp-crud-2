<%@page import="java.text.DecimalFormat"%> <!-- java.text.DecimalFormat을 import를 한다 가격에 콤마를 찍기 위해서 -->
<%@page import="java.text.SimpleDateFormat"%><!-- java.text.SimpleDateFormat를 import를 한다 날짜에 년월일 형식으로 표시하기 위해서 -->
<%@page import="java.sql.Date"%> <!-- sql에 date를 import -->
<%@page import="book.BookVO"%><!-- BookVO를 import -->
<%@page import="java.util.ArrayList"%> <!-- ArrayList import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");
	/* 목록을 보여주기 위해 먼저 BookListController에 가기에 그곳에서 보낸 list를 받는다 */
	String pub = "";
	/* 출판사 코드에 따른 표현을 하기 위해 */
%>
<style>
.container > table {
	text-align: center;
	/* table에서 글씨를 가운데에 보이기 위해서 사용 */
}
</style>
<section>
	<div class="container">
		<table border="2" width="100%">
		<!-- 테이블을 화면 크기에 맞게 만든다 -->
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
					/* list가 null이 아니라면 */
					for (int i = 0; i < list.size(); i++) {
						/* list를 하나씩 돌면서 VO를 불러온뒤 그 vo에 담는다 */
						BookVO vo = new BookVO();
						vo = list.get(i);
						/* 리스트의 i번쨰를 vo에 담는다 */
			%>
			<tr>
				<td><a href="/updateBook.jsp?bcode=<%=vo.getBcode()%>"><%=vo.getBcode()%></a></td>
				<!-- update를 위해 bcode를 담는다 -->
				<td><%=vo.getBtitle()%></td>
				<td><%=vo.getBwriter()%></td>
				<%
					switch (vo.getBpub()) {
					/* 출판사 코드에 따라 출판사 이름이 다르기 때문에 switch함수를 사용한다 */
								case 1001 :
									/* 코드가 1001이라면 양영디지털 */
									pub = "양영디지털";
									break;
								case 1002 :
									/* 코드가 1002라면 북스미디어 */
									pub = "북스미디어";
									break;
								case 1003 :
									/* 코드가 1003이라면 한빛아카데미 */
									pub = "한빛아카데미";
									break;
								case 1004 :
									/* 코드가 1004이라면 이지스 */
									pub = "이지스";
									break;
							}
				%>
				<td><%=pub%></td>
				<%
					int bprice = vo.getBprice();
					/* 이 작업은 책 가격에 콤마를 찍기위해서다 */
							DecimalFormat df = new DecimalFormat("###,###");
						/* DecimalFormat로  ###.###으로 설정한다*/	
					String price = df.format(bprice);
						/* 받은 bprice를 df.format(bprice)를 해서 정한 형식으로 price를 만들어서 그걸 출력한다 */
				%>
				<td><%=price%></td>
				<%
					Date bdate = vo.getBdate();
				/* 날짜 형식을 yyyy년MM월dd일로 위해서*/
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
				/* SimpleDateFormat으로 yyyy년MM월dd일로 설정 */
							String date = sdf.format(bdate);
				/* 받은 bdate값을 정한 형식으로 변환해서 출력 */
				%>
				<td><%=date%></td>
				<td><a href="/deleteBook.jsp?bcode=<%=vo.getBcode()%>">삭제</a></td>
				<!-- 삭제를 위해 bcode를 담는다 -->
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>

	<%@ include file="footer.jsp"%>