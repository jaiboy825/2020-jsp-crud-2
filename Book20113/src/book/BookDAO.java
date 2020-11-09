package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {
	private static BookDAO instance = new BookDAO();

	private BookDAO() {
	}

	public static BookDAO getInstance() {
		return instance;
	}

	private static ArrayList<BookVO> list = new ArrayList<BookVO>();

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

	public int bCodeMax() {
		int n = 0;

		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT MAX(bcode) + 1 FROM book_tbl");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				n = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
	
		return n;
	}

	// DB 관련 객체 반환
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("rs.close() 오류 발생 : " + e);
			}
		}

		close(conn, pstmt);
	}

	public static void close(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("pstmt.close() 오류 발생 : " + e);
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("conn.close() 오류 발생 : " + e);
			}
		}
	}
}
