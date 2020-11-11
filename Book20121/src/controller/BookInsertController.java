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
 * BookInsertController를 이용하기 위해서 BookInsert.do라는 경로로 왔을때 이 컨트롤러를 이용한다
 */
@WebServlet("/BookInsert.do")
public class BookInsertController extends HttpServlet {
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
		//dao 부르기
		//bcode값 req에서 가져오기
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		//btitle값 req에서 가져오기
		String btitle = req.getParameter("btitle");
		//bwriter값 req에서 가져오기
		String bwriter = req.getParameter("bwriter");
		//bpub값 req에서 가져오기
		int bpub = Integer.parseInt(req.getParameter("bpub"));
		//bprice값 req에서 가져오기
		int bprice = Integer.parseInt(req.getParameter("bprice"));
		//bdate값 req에서 가져오기
		Date bdate = Date.valueOf(req.getParameter("bdate"));
		// vo 객체 생성 -> 담기 -> DAO에서 메서드 처리
		BookVO vo = new BookVO(bcode, btitle, bwriter, bpub, bprice, bdate);
		//dao에 있는 insertBoard에 vo를 보내서 insert시킨다 그 결과값을 temp에 받는다
		int temp = dao.insertBoard(vo);
		//temp > 0 이라면 성공 아니라면 실패
		if(temp > 0) {
			//ok라는 항목에 메시지를 보내고 insertBook.jsp로 보낸다
			req.setAttribute("ok", "도서 등록 성공");
			req.getRequestDispatcher("/insertBook.jsp").forward(req, resp);
			
		}else {
			//error라는 항목에 메시지를 보내고 insertBook.jsp로 보낸다
			req.setAttribute("error", "아이디 중복 오류 입니다.");
			req.getRequestDispatcher("/insertBook.jsp").forward(req, resp);
		}
	}
}
