package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;

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
@WebServlet("/BookDelete.do")
public class BookDeleteController extends HttpServlet {
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

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 한글 인코딩처리
		req.setCharacterEncoding("utf-8");
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		BookDAO dao = new BookDAO();
		int n = dao.deleteBook(bcode);
		
		if (n > 0) {
			req.setAttribute("ok", "도서 삭제 완료");
		} else {
			req.setAttribute("error", "도서 삭제 실패");
		}
		req.getRequestDispatcher("/deleteBook.jsp").forward(req, resp);
	}
}
