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
 */
@WebServlet("/BookInsert")
public class BookInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		//한글 인코딩처리
		req.setCharacterEncoding("utf-8");
		//파라미터 가져오기
		BookDAO instance = BookDAO.getInstance();
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		String btitle = req.getParameter("btitle");
		String bwriter = req.getParameter("bwriter");
		int bpub = Integer.parseInt(req.getParameter("bwriter"));
		int bprice = Integer.parseInt(req.getParameter("bprice"));
		Date bdate = Date.valueOf(req.getParameter("bdate"));
		// vo 객체 생성 -> 담기 -> DAO에서 메서드 처리
		BookVO vo = new BookVO(bcode, btitle, bwriter, bpub, bprice, bdate);
		int temp = instance.insertBoard(vo);
		
//		if(temp > 0) {
//			req.setAttribute("bcode", bcode);
//			req.getRequestDispatcher("/view/memberInsertOutput.jsp").forward(req, resp);
//			
//		}else {
//			req.setAttribute("error", "아이디 중복 오류 입니다.");
//			req.getRequestDispatcher("/view/memberInsert.jsp").forward(req, resp);
//		}
	}
}
