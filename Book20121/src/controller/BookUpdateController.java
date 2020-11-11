package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;

/**
 * Servlet implementation class BookInsertController
 * 
 * BookUpdateController를 이용하기 위해서 BookUpdate.do라는 경로로 왔을때 이 컨트롤러를 이용한다
 * 
 */
@WebServlet("/BookUpdate.do")
public class BookUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// doProcess에서 처리
		doProcess(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// doProcess에서 처리
		doProcess(req, resp);
	}
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		//한글 인코딩처리
		req.setCharacterEncoding("utf-8");
		//파라미터 가져오기
		BookDAO dao = new BookDAO();
		//dao부르기
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		//bcode값을 req에서 가져온다
		String btitle = req.getParameter("btitle");
		//btitle값을 req에서 가져온다
		String bwriter = req.getParameter("bwriter");
		//bpub값을 req에서 가져온다
		int bpub = Integer.parseInt(req.getParameter("bpub"));
		//bprice값을 req에서 가져온다
		int bprice = Integer.parseInt(req.getParameter("bprice"));
		//bdate값을 req에서 가져온다
		Date bdate = Date.valueOf(req.getParameter("bdate"));
		// vo 객체 생성 -> 담기 -> DAO에서 메서드 처리
		BookVO vo = new BookVO(bcode, btitle, bwriter, bpub, bprice, bdate);
		int temp = dao.updateBoard(vo);
		//temp값이 > 0이라면 성공 아니라면 실패(에러)
		if(temp > 0) {
			req.setAttribute("ok", "도서 정보 수정 성공");
			//ok라는 항목에 메시지를 담아서 updateBook.jsp로 보낸다
			req.getRequestDispatcher("/updateBook.jsp").forward(req, resp);
			
		}else {
			req.setAttribute("error", "에러 입니다.");
			//error라는 항목에 메시지를 담아서 updateBook.jsp로 보낸다
			req.getRequestDispatcher("/updateBook.jsp").forward(req, resp);
		}
	}
}
