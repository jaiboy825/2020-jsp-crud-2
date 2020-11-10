package book;

import java.sql.*;
import java.util.ArrayList;

public class BookDAO {

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

	public int getMaxNo() {
		int num = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select max(bcode) from book_tbl");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return num + 1;
	}

	public int insertBoard(BookVO vo) {
		int n = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("insert into book_tbl values(?,?,?,?,?,?)");
			pstmt.setInt(1, vo.getBcode());
			pstmt.setString(2, vo.getBtitle());
			pstmt.setString(3, vo.getBwriter());
			pstmt.setInt(4, vo.getBpub());
			pstmt.setInt(5, vo.getBprice());
			pstmt.setDate(6, vo.getBdate());
			n = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}

		return n;

	}

	public ArrayList<BookVO> getList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();

		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from book_tbl order by bcode asc");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookVO vo = new BookVO();
				vo.setBcode(rs.getInt("bcode"));
				vo.setBtitle(rs.getString("btitle"));
				vo.setBwriter(rs.getString("bwriter"));
				vo.setBpub(rs.getInt("bpub"));
				vo.setBprice(rs.getInt("bprice"));
				vo.setBdate(rs.getDate("bdate"));
				list.add(vo);
			}
			System.out.println("책 목록 출력 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("책 목록 출력 실패");
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}

	public BookVO findUser(int bcode) {
		BookVO vo = new BookVO();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from book_tbl where bcode = ?");
			pstmt.setInt(1, bcode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setBcode(bcode);
				vo.setBtitle(rs.getString("btitle"));
				vo.setBwriter(rs.getString("bwriter"));
				vo.setBpub(rs.getInt("bpub"));
				vo.setBprice(rs.getInt("bprice"));
				vo.setBdate(rs.getDate("bdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}

		return vo;
	}

	public int updateBoard(BookVO vo) {
		int n = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement("update book_tbl set btitle = ?, bwriter = ?, bpub = ?, bprice = ? where bcode = ?");
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBwriter());
			pstmt.setInt(3, vo.getBpub());
			pstmt.setInt(4, vo.getBprice());
			pstmt.setInt(5, vo.getBcode());
			n = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}

		return n;
	}
	public int deleteBook(int bcode) {
		int n = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from book_tbl where bcode = ?");
			pstmt.setInt(1, bcode);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		
		return n;
	}
}
