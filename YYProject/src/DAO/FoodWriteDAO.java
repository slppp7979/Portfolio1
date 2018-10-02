package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.FoodWriteVO;

public class FoodWriteDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	
	public Connection getInstance() {	
		try {
			Context ctx = new InitialContext();	
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/java/Orcl");
			return ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void insert(FoodWriteVO vo, String bKind) {
	      
		String sql ="insert into food_board(bNum, bName, bTel, bTime, bImg, bAdd1, bAdd2, bLocation, bKind, bMenu1_Img, bMenu2_Img, bMenu3_Img, bMenu1_Detail, bMenu2_Detail, bMenu3_Detail, bInfo, bHash, bStar) values(fb_seq.nextVal, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	      
	      try {
	    	  
	         conn = getInstance();
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, vo.getbName());
	         pstmt.setString(2, vo.getbTel());
	         pstmt.setString(3, vo.getbTime());
	         pstmt.setString(4, vo.getbImg());
	         pstmt.setString(5, vo.getbAdd1());
	         pstmt.setString(6, vo.getbAdd2());
	         pstmt.setString(7, vo.getbLocation());
	         pstmt.setString(8, bKind);
	         pstmt.setString(9, vo.getbMenu1_Img());
	         pstmt.setString(10, vo.getbMenu2_Img());
	         pstmt.setString(11, vo.getbMenu3_Img());
	         pstmt.setString(12, vo.getbMenu1_Detail());
	         pstmt.setString(13, vo.getbMenu2_Detail());
	         pstmt.setString(14, vo.getbMenu3_Detail());
	         pstmt.setString(15, vo.getbInfo());
	         pstmt.setString(16, vo.getbHash());
	         pstmt.setInt(17, vo.getbStar());
	           
	         pstmt.executeUpdate();
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {	// 열려있는 반대로 닫아준다. 항상 conn객체가 마지막에 닫혀야함! 
	    	  try {
	    		  if(pstmt != null) pstmt.close();
	    		  if(conn != null) conn.close();
	    	  }catch(Exception e) {
	    		  e.printStackTrace();
	    	  }
	      }
	   }
	
	public ArrayList<FoodWriteVO> getFoodList(String location){
		ArrayList<FoodWriteVO> list = new ArrayList<FoodWriteVO>();
		String sql = "select * from food_board where bAdd1 like '%"+location+"%'";
		// food_board에서 bAdd1을 가져오고 그 값과 location값이 같으면 불러옴
		// 앞 뒤의 '%'는 해당 내용을 제목 어딘가에 포함하고 있다면 모두 검색되도록 처리한 것
			// %의 위치에 따라 찾는 키워드가 다름
				// ex) %a = a로 시작하는 것만 찾음, a% = a로 끝나는 것만 찾음, %a% = a가 들어간 것 찾음
		
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FoodWriteVO vo = new FoodWriteVO();
				vo.setbNum(rs.getInt("bNum"));
				vo.setbName(rs.getString("bName"));
				vo.setbImg(rs.getString("bImg"));
				vo.setbDate(rs.getTimestamp("bDate"));
				vo.setbTel(rs.getString("bTel"));
				vo.setbTime(rs.getString("bTime"));
				vo.setbAdd1(rs.getString("bAdd1"));
				vo.setbAdd2(rs.getString("bAdd2"));
				vo.setbLocation(rs.getString("bLocation"));
				
				String temp = rs.getString("bKind");
				
				StringTokenizer tokens = new StringTokenizer(temp, "_");
				String[] bKind = new String[tokens.countTokens()];
				
				int count = 0;
				
				while(tokens.hasMoreTokens()) {
					bKind[count++] = tokens.nextToken();
				}
				
				vo.setbKind(bKind);
				vo.setbMenu1_Img(rs.getString("bMenu1_Img"));
				vo.setbMenu2_Img(rs.getString("bMenu2_Img"));
				vo.setbMenu3_Img(rs.getString("bMenu3_Img"));
				vo.setbMenu1_Detail(rs.getString("bMenu1_Detail"));
				vo.setbMenu2_Detail(rs.getString("bMenu2_Detail"));
				vo.setbMenu3_Detail(rs.getString("bMenu3_Detail"));
				vo.setbInfo(rs.getString("bInfo"));
				
				String temp2 = rs.getString("bHash");
				StringTokenizer temp3 = new StringTokenizer(temp2, "_");
				String bHash = temp3.nextToken();
				
				while(temp3.hasMoreTokens()) {
					bHash += " "+temp3.nextToken();		// 공백을 넣음
				}
				
				vo.setbHash(bHash);
				vo.setbStar(rs.getInt("bStar"));
				
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	// 열려있는 반대로 닫아준다. 항상 conn객체가 마지막에 닫혀야함! 
	    	  try {
	    		  if(rs != null) rs.close();
	    		  if(pstmt != null) pstmt.close();
	    		  if(conn != null) conn.close();
	    	  }catch(Exception e) {
	    		  e.printStackTrace();
	    	  }
	      }
		
		return list;
	}
	
	// search 결과를 위한 메서드
	public ArrayList<FoodWriteVO> getSearchList(String keyword, String type){
		
		ArrayList<FoodWriteVO> list = new ArrayList<FoodWriteVO>();
		String sql = "";	// 변수는 밖에 선언하고
		
		// 이 안에서 sql 초기화를 시켜준다.
		if(type.equals("tbName")) {
			sql = "select * from food_board where bName like '%"+keyword+"%'";
		}else if(type.equals("tbLocation")) {
			sql = "select * from food_board where bLocation like '%"+keyword+"%'";
		}else if(type.equals("tbHash")) {
			sql = "select * from food_board where bHash like '%"+keyword+"%'";
		}
		
				
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FoodWriteVO vo = new FoodWriteVO();

				vo.setbNum(rs.getInt("bNum"));
				vo.setbName(rs.getString("bName"));
				vo.setbDate(rs.getTimestamp("bDate"));
				vo.setbImg(rs.getString("bImg"));
				vo.setbTel(rs.getString("bTel"));
				vo.setbTime(rs.getString("bTime"));
				vo.setbAdd1(rs.getString("bAdd1"));
				vo.setbAdd2(rs.getString("bAdd2"));
				vo.setbLocation(rs.getString("bLocation"));
				
				String temp = rs.getString("bKind");
				
				StringTokenizer tokens = new StringTokenizer(temp, "_");
				String[] bKind = new String[tokens.countTokens()];
				
				int count = 0;
				
				while(tokens.hasMoreTokens()) {
					bKind[count++] = tokens.nextToken();
				}
				
				vo.setbKind(bKind);
				vo.setbMenu1_Img(rs.getString("bMenu1_Img"));
				vo.setbMenu2_Img(rs.getString("bMenu2_Img"));
				vo.setbMenu3_Img(rs.getString("bMenu3_Img"));
				vo.setbMenu1_Detail(rs.getString("bMenu1_Detail"));
				vo.setbMenu2_Detail(rs.getString("bMenu2_Detail"));
				vo.setbMenu3_Detail(rs.getString("bMenu3_Detail"));
				vo.setbInfo(rs.getString("bInfo"));

				String temp2 = rs.getString("bHash");
				StringTokenizer temp3 = new StringTokenizer(temp2, "_");
				String bHash = temp3.nextToken();
				
				while(temp3.hasMoreTokens()) {
					bHash += " "+temp3.nextToken();		// 공백을 넣음
				}
				
				vo.setbHash(bHash);
				vo.setbStar(rs.getInt("bStar"));
				
				list.add(vo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 게시물 하나의 정보니까 arraylist쓸 필요 x
	public FoodWriteVO boardUpdateForm(String bNum) {
		String sql = "select * from food_board where bNum = ?";	// where 뒤에 있는걸 불러온다 
		FoodWriteVO vo = new FoodWriteVO();
		
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bNum);
			rs = pstmt.executeQuery();	// executeQuery는 반환형이 rs이니까 rs에 담아줘야 사용가능
			
			// rs로 조회를 했으면 무조건 rs.next()로 호출해야함 왜냐면 빈곳을 가리키고 있으니까!
			while(rs.next()) {

				vo.setbNum(rs.getInt("bNum"));
				vo.setbName(rs.getString("bName"));
				vo.setbDate(rs.getTimestamp("bDate"));
				vo.setbTel(rs.getString("bTel"));
				vo.setbTime(rs.getString("bTime"));
				vo.setbAdd1(rs.getString("bAdd1"));
				vo.setbAdd2(rs.getString("bAdd2"));
				vo.setbLocation(rs.getString("bLocation"));
				
				String temp = rs.getString("bKind");
				
				StringTokenizer tokens = new StringTokenizer(temp, "_");
				String[] bKind = new String[tokens.countTokens()];
				
				int count = 0;
				
				while(tokens.hasMoreTokens()) {	//hasMoreTokens은 boolean타입 (==rs.next)
					bKind[count++] = tokens.nextToken();
				}
				
				vo.setbKind(bKind);
				vo.setbMenu1_Img(rs.getString("bMenu1_Img"));
				vo.setbMenu2_Img(rs.getString("bMenu2_Img"));
				vo.setbMenu3_Img(rs.getString("bMenu3_Img"));
				vo.setbMenu1_Detail(rs.getString("bMenu1_Detail"));
				vo.setbMenu2_Detail(rs.getString("bMenu2_Detail"));
				vo.setbMenu3_Detail(rs.getString("bMenu3_Detail"));
				vo.setbInfo(rs.getString("bInfo"));
				vo.setbHash(rs.getString("bHash"));
				vo.setbStar(rs.getInt("bStar"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// vo 반환해서 띄워줌 
		return vo;	
	}
	
	// 글쓰는 거랑 똑같으니까 매개변수도 같음
	public void boardUpdate(FoodWriteVO vo, String bKind) {
		String sql = "update food_board set bName=?, bTel=?, bTime=?, bImg=?, bAdd1=?, bAdd2=?, bLocation=?, bKind=?, bMenu1_Img=?, bMenu2_Img=?, bMenu3_Img=?, bMenu1_Detail=?, bMenu2_Detail=?, bMenu3_Detail=?, bInfo=?, bHash=?, bStar=? where bNum = ?";
		// update랑 delete는 무조건 where절을 넣어서 지정해줘야 함!! 안그러면 전체가 바뀜!!!!
		
		// try-catch문 insert내용 그대로
		try {
	    	  
	         conn = getInstance();
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, vo.getbName());
	         pstmt.setString(2, vo.getbTel());
	         pstmt.setString(3, vo.getbTime());
	         pstmt.setString(4, vo.getbImg());
	         pstmt.setString(5, vo.getbAdd1());
	         pstmt.setString(6, vo.getbAdd2());
	         pstmt.setString(7, vo.getbLocation());
	         pstmt.setString(8, bKind);
	         pstmt.setString(9, vo.getbMenu1_Img());
	         pstmt.setString(10, vo.getbMenu2_Img());
	         pstmt.setString(11, vo.getbMenu3_Img());
	         pstmt.setString(12, vo.getbMenu1_Detail());
	         pstmt.setString(13, vo.getbMenu2_Detail());
	         pstmt.setString(14, vo.getbMenu3_Detail());
	         pstmt.setString(15, vo.getbInfo());
	         pstmt.setString(16, vo.getbHash());
	         pstmt.setInt(17, vo.getbStar());
	         pstmt.setInt(18, vo.getbNum());
	         
	         pstmt.executeUpdate();
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {	// 열려있는 반대로 닫아준다. 항상 conn객체가 마지막에 닫혀야함! 
	    	  try {
	    		  if(pstmt != null) pstmt.close();
	    		  if(conn != null) conn.close();
	    	  }catch(Exception e) {
	    		  e.printStackTrace();
	    	  }
	      }
	}
	
	public void boardDelete(String bNum) {
		String sql = "delete from food_board where bNum = ?";
		
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bNum);
			pstmt.executeUpdate();	//select빼고는 다 Update(insert, delete, update)
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int findChangeIdEmail(String id, String email) {
		String sql = "select * from member where id = ? and email =?";
		// 아이디와 비밀번호를 가져옴. 아이디가 ?, 이메일이 ?인 행
		 
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// mypage의 비밀번호 찾기와 변경 페이지의 비밀번호 변경 메서드
	public int findChangePass(String password, String id) {
		String sql = "update member set password=? where id=?";
		// id가 ?인 것의 password를 업데이트한다.
		
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, password);
			pstmt.setString(2, id);
			
			return pstmt.executeUpdate();
			// pstmt는 원래 int형이다.
			// id는 중복값이 없으므로 return = 1을 하지 않아도 1로 비교할 수 있다. 항상 최대값이 1임(id가 프라이머리 키니까!)
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // id가 존재하지 않으면 -1 리턴
	}
	
	public int changePass(String password, String id) {
		String sql = "select password from member where id =?";
		// 아이디가 ?인 것의 비밀번호를 선택하여 읽는다.
		
		try {
			conn = getInstance();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			// 조회해서 값이 일치하면 return 1
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//해당 사용자를 id기준으로 선택해서 지운다.
	   public int deleteMember(String userId) {
	      String sql = "delete FROM member where id = ?";
	      
	      try {
	         conn = getInstance();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         
	         return pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
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
