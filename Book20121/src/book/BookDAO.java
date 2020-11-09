package book;

import java.sql.*;
import java.util.ArrayList;

public class BookDAO {

	public static BookDAO instance = new BookDAO();

	private BookDAO() {
	}

	public static BookDAO getInstance() {
		return instance;
	}

	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "1234";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(ResultSet rs, Connection conn, PreparedStatement pstmt) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("rs");
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("pstmt");
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("conn");
			}
		}
	}

	private static ArrayList<BookVO> list = new ArrayList<BookVO>();

	public int getMaxNo() {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement("select max(bcode) num from book_tbl");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, conn, pstmt);
		}
		return num + 1;
	}

	public void insertBoard(BookVO vo) {
		// TODO Auto-generated method stub

	}
}
