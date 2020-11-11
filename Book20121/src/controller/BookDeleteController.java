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
 * 
 * BookDeleteController를 이용하기 위해서 BookDelete.do라는 경로로 왔을때 이 컨트롤러를 이용한다
 */
@WebServlet("/BookDelete.do")
public class BookDeleteController extends HttpServlet {
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

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 한글 인코딩처리
		req.setCharacterEncoding("utf-8");
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		//bcode값을 req에서 가져온다 
		BookDAO dao = new BookDAO();
		//dao부르기
		int n = dao.deleteBook(bcode);
		//dao에 있는 deleteBook에 bcode값을 담아서 delete하고 결관를 n에 받는다
		//n이 > 0 이라면 성공 아니라면 실패이다
		if (n > 0) {
			//ok라는 항목에 메시지를 담고
			req.setAttribute("ok", "도서 삭제 완료");
		} else {
			//error라는 항목에 메시지를 담고
			req.setAttribute("error", "도서 삭제 실패");
		}
		//deleteBook.jsp로 보낸다
		req.getRequestDispatcher("/deleteBook.jsp").forward(req, resp);
		
		//또 다른 여담으로 mvc패턴을 배우기 전에는 session에 담고 그랬었는데 벌써 3학년이 되기 직전이고 회사에 가기 직전이다보니 
		//이리저리 생각이 많아지는거 같다 앞으로 잘할수 있을지는 잘 모르겠어서 걱정이다.
	}
}
