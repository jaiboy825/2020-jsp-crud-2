package book;

import java.sql.*;
import java.util.ArrayList;

public class BookDAO {
	//모든 rs, pstmt, conn 은 Connection 과 PreparedStatement, Result를 불러온뒤 지정한 이름이다
	public Connection getConnection() {
		//Connection에 필요한 url값
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//Database에서 사용할 계정의 아이디값
		String user = "hr";
		//Database에서 사용할 계정의 비밀번호
		String password = "hr";
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
		//conn pstmt rs 모두 있을때 사용하는 close (방과후에서 배운것을 활용)
		if (rs != null) {
			//rs가 null이 아니라면 
			try {
				rs.close();
				//rs를 close시킨다
			} catch (SQLException e) {
				System.out.println("rs.close() 오류 발생 : " + e);
			}
		}
		//남은 conn과 pstmt는 다른 close로 보낸다
		close(conn, pstmt);
	}

	public static void close(Connection conn, PreparedStatement pstmt) {
		//rs를 제외한 conn과 pstmt 에 사용하는 close
		if (pstmt != null) {
			//pstmt가 null이 아니라면
			try {
				//pstmt를 close시킨다
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("pstmt.close() 오류 발생 : " + e);
			}
		}
		//conn이 null이 아니라면
		if (conn != null) {
			try {
				//conn을 close 시킨다
				conn.close();
			} catch (SQLException e) {
				System.out.println("conn.close() 오류 발생 : " + e);
			}
		}
	}
	//자동으로 생성되는 도서코드 생성 코드, 마지막 번호 + 1을 시킨다
	public int getMaxNo() {
		int num = 0;
		//초기값 0
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//conn pstmt rs 부른다
		try {
			//book_tbl에서 bcode중 가장 큰 값을 가져온다
			pstmt = conn.prepareStatement("select max(bcode) from book_tbl");
			//select 문이기 때문데 executeQuery를 쓴다
			rs = pstmt.executeQuery();
			//rs.next()라면 그 최댓값이 있다는것으로 
			if (rs.next()) {
				//rs 에 첫번쨰에 그 값이 있기에 num에 담아준다
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//conn과 pstmt rs를 close
			close(conn, pstmt, rs);
		}
		//만약에 table에 아무값도 없다면
		//if(num == 0) {
		//	num = 10100;
		//	return num;
		//}else {
			return num + 1;			
		//}
	}
	//db에 책을 입력하기 위해서
	public int insertBoard(BookVO vo) {
		int n = 0;
		//return값 0
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		//conn pstmt 부르기
		try {
			//받은 vo의 값들을 book_tbl에 insert 시킨다
			pstmt = conn.prepareStatement("insert into book_tbl values(?,?,?,?,?,?)");
			//vo 의 bcode
			pstmt.setInt(1, vo.getBcode());
			//vo 의 btitle
			pstmt.setString(2, vo.getBtitle());
			//vo 의 bwriter
			pstmt.setString(3, vo.getBwriter());
			//vo 의 bpub
			pstmt.setInt(4, vo.getBpub());
			//vo 의 bprice
			pstmt.setInt(5, vo.getBprice());
			//vo 의 bdate
			pstmt.setDate(6, vo.getBdate());
			//insert 하는 것이기 떄문에 executeUpdate이다 그 결과를 n에 담는다
			n = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//불러온 conn과 pstmt를 close
			close(conn, pstmt);
		}
		//결과값 리턴
		return n;

	}
	//도서목록조희/수정 페이지에서 보여주기 위한 데이터들을 list로 보내기 위한것
	public ArrayList<BookVO> getList() {
		//보낼 list를 ArrayList<BookVO> 형식으로 만든다
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		// conn 과 pstmt rs 불러온다
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//book_tbl의 모든값들을 가져온다 bcode 오름차순으로
			pstmt = conn.prepareStatement("select * from book_tbl order by bcode asc");
			//select 이기 떄문에 executeQuery이다
			rs = pstmt.executeQuery();
			//rs.next일때 
			while (rs.next()) {
				BookVO vo = new BookVO();
				//BookVO를 불러오고 vo에 bcode, btitle, bwriter, bpub, bprice, bdate를 담는다
				vo.setBcode(rs.getInt("bcode"));
				vo.setBtitle(rs.getString("btitle"));
				vo.setBwriter(rs.getString("bwriter"));
				vo.setBpub(rs.getInt("bpub"));
				vo.setBprice(rs.getInt("bprice"));
				vo.setBdate(rs.getDate("bdate"));
				//값을 담은 vo를 list에 담는다
				list.add(vo);
			}
			System.out.println("책 목록 출력 완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("책 목록 출력 실패");
			e.printStackTrace();
		} finally {
			//불러온 conn, pstmt, rs를 close한다
			close(conn, pstmt, rs);
		}
		//모든 값을 담은 list를 리턴
		return list;
	}
	//book정보를 update 하기 위해서 받은 bcode에 해당하는 정보를 찾는다
	public BookVO findBook(int bcode) {
		//BookVO를 불러온다
		BookVO vo = new BookVO();
		//conn pstmt rs를 불러온다
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//bcode가 받은 bcode인 책의 정보를 모두 가져온다
			pstmt = conn.prepareStatement("select * from book_tbl where bcode = ?");
			pstmt.setInt(1, bcode);
			//select이기 떄문에 executeQuery 이다
			rs = pstmt.executeQuery();
			//rs.next일때
			if (rs.next()) {
				//만든 vo 에 받은 bcode와 rs에 btitle, bwriter, bpub, bprice, bdate를 담는다
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
			//불러온 conn pstmt rs를 close 한다
			close(conn, pstmt, rs);
		}
		//불러온 값을 담은 vo를 리턴한다
		return vo;
	}
	//Book정보를 update하기 위해서 받은 vo값을 update 한다
	public int updateBoard(BookVO vo) {
		int n = 0;
		//초기값 0
		//conn과 pstmt 가져온다
		Connection conn = getConnection();
		PreparedStatement pstmt = null;

		try {
			//book_tbl에서 변경할 값들을 bcode가 vo에 담긴 bcode인 것을 변경 한다
			pstmt = conn.prepareStatement("update book_tbl set btitle = ?, bwriter = ?, bpub = ?, bprice = ?, bdate = ? where bcode = ?");
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBwriter());
			pstmt.setInt(3, vo.getBpub());
			pstmt.setInt(4, vo.getBprice());
			pstmt.setDate(5, vo.getBdate());
			pstmt.setInt(6, vo.getBcode());
			//update이기에 executeUpdate 이고 그 결과 값을 n에 담는다
			n = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			//불러온 conn pstmt를 close 한다
			close(conn, pstmt);
		}
		//결과값 리턴
		return n;
	}
	//bcode에 해당하는 정보를 delete한다
	public int deleteBook(int bcode) {
		int n = 0;
		//초기값 0
		//conn과 pstmt를 가져온다
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		try {
			//bcode가 받아온 bcode 인것을 delete한다
			pstmt = conn.prepareStatement("delete from book_tbl where bcode = ?");
			pstmt.setInt(1, bcode);
			//delete이기 때문에 executeUpdate이고 그 결과 값을 n에 담는다
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//불러온 conn pstmt를 close 한다
			close(conn, pstmt);
		}
		//결과 값 리턴
		return n;
	}
}
