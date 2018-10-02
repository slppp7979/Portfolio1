package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import VO.UserVO;

public class UserDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String pass = "java";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	// 생성자 생성
	public UserDAO() {
		try {
			Class.forName(driver);	// db 접근
			conn = DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원가입
	public int join(UserVO vo) {
		String sql = "insert into member(name, id, password, email) values (?, ?, ?, ?)";	// member 테이블의 모든 컬럼을 채울게 아니면 명시해줘야함!
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	// 0들어가면 회원가입 실패
	}
	
	// 로그인
	public boolean login(String id, String password) {
		
		boolean isLogin = false;	// 기본은 false
		
		String sql = "select password from member where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// table에 있는 회원들의 정보들을 하나씩 검사하며 일치하는 것을 찾아본다.
				if(rs.getString(1).equals(password)) {	// getString(1) == id
					isLogin = true;	// 로그인 성공
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isLogin;
	}
	
	// 날짜
	public String getDate() {
		String sql ="select sysdate from dual";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			return rs.getString(1).substring(0, 10);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	// 아이디 중복체크
	public int checkId(String inputId) {
		String sql = "select * from user WHERE id = ?";	// inputId에 해당하는 id가 테이블 내에 있으면 rs.next()로 받아옴
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			
			rs = pstmt.executeQuery();
			
			// id가 존재하면 rs.next()가 true이므로 if문 실행
			if(rs.next()) {
				return 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	// ajax 사용했을 땐 꼭 finally 사용하여 close() 시켜줘야한다.
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		// id가 존재하지 않음
		return 1;
	}
	
	public void finally_close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
