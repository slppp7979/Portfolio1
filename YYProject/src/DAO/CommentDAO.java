package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.CommentVO;
import VO.FoodWriteVO;

public class CommentDAO {

   // 댓글 관리를 위한 dao
   private Connection conn;
   private PreparedStatement pstmt;
   private Statement stmt;
   private ResultSet rs;

   public Connection getInstance() {
      try {
         Context ctx = new InitialContext();
         DataSource ds = (DataSource) ctx.lookup("java:comp/env/java/Orcl");
         return ds.getConnection();
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      return conn;

   }

   // y_comment 테이블의 cNum으로 데이터 한 개 가져오기
   
   public ArrayList<CommentVO> getNum(int cNum) {

      CommentVO vo = new CommentVO();
      ArrayList<CommentVO> list = new ArrayList<CommentVO>(); 
      String sql = "select * from y_comment where cNum=?"; // cNum을 기준으로 가져온다.

      try {
         conn = getInstance();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, cNum);

         rs = pstmt.executeQuery();
         rs.next(); // 하나이므로 if문이나 while문에 넣어줄 필요가 없다.

         vo.setcNum(rs.getInt("cNum"));
         vo.setcId(rs.getString("cId"));
         vo.setcContent(rs.getString("cContent"));
         vo.setcReg_date(rs.getString("cReg_date"));
         vo.setcStar(rs.getInt("cStar"));
         vo.setcReg_flag(rs.getInt("cReg_flag"));
         
         list.add(vo);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   
   public void commentInsert(CommentVO vo) {
	   
	   String sql="insert into y_comment(cNum, cId, cContent, cStar, cReg_flag) values(yc_seq.nextVal, ?, ?, ?, ?)";		//yc_seq.nextVal : seq테이블에서 nextVal메서드를 호출
	   
	   try {
		   conn = getInstance();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, vo.getcId());
		   pstmt.setString(2, vo.getcContent());
		   pstmt.setInt(3, vo.getcStar());
		   pstmt.setInt(4, vo.getcReg_flag());
		   
		   pstmt.executeUpdate();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
   }

   public ArrayList<CommentVO> getCommentList() {
	   ArrayList<CommentVO> commentList = new ArrayList<CommentVO>();
	   String sql1 = "select bNum from food_board order by bNum desc";
	   String sql2 = "select * from y_comment where cReg_flag = ?";
	   
	   try {
		   conn = getInstance();
		   pstmt = conn.prepareStatement(sql1);
		   rs = pstmt.executeQuery();	// 부모 게시글의 번호 불러옴
		   
		   ArrayList<Integer> bNums = new ArrayList<Integer>();
		   
		   while(rs.next()) {		// rs에는 sql1에서 넣어준 bNum이 유지되어야 하니까 bNums에 첫번째 쿼리로 조회한 bNum값을 담아서 for문 실행
			   bNums.add(rs.getInt("bNum"));
		   }
		   
		   for(int i=0; i<bNums.size(); i++) {
			   pstmt = conn.prepareStatement(sql2);
			   pstmt.setInt(1, bNums.get(i));	// ArrayList의 첫뺀째 게시글의 번호를 가져옴
			   
			   rs = pstmt.executeQuery();	// 댓글 정보 불러옴
			   
			   while(rs.next()) {
				   CommentVO vo = new CommentVO();
				   vo.setcNum(rs.getInt("cNum"));
				   vo.setcId(rs.getString("cId"));
				   vo.setcContent(rs.getString("cContent"));
				   vo.setcStar(rs.getInt("cStar"));
				   vo.setcReg_flag(rs.getInt("cReg_flag"));
				   vo.setcReg_date(rs.getString("cReg_date"));
				   
				   commentList.add(vo);
			   }
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return commentList;
   }
   
   public ArrayList<FoodWriteVO> getScore(ArrayList<FoodWriteVO> list) {
	   String sql = "select cStar from y_comment where cReg_flag = ?";
	   
	   try {
		   conn = getInstance();
		   
		   for(int i=0; i<list.size(); i++) {	// 값이 계속 바뀌어야하니까 for문 사용
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, list.get(i).getbNum());
			   
			   rs = pstmt.executeQuery();
			   
			   // 평균값을 내기위해 변수생성
			   int total = 0;
			   int count = 0;
			   
			   while(rs.next()) {	// 댓글 루프
				   total += rs.getInt("cStar");
				   count++;
			   }
			   
			   if(count > 0) {
				   list.get(i).setcStar(total/count);	// 평균
			   }else {
				   list.get(i).setcStar(0);
			   }
		   }
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return list;
   }

   public void commentDelete(int cNum) {
	   String sql = "delete from y_comment where cNum = ?";
	   
	   try {
		   conn = getInstance();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, cNum);
		   
		   pstmt.executeUpdate();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
   }
   
   /* close */
   public void finally_close() {
      try {
         if (rs != null)
            rs.close();
         if (pstmt != null)
            pstmt.close();
         if (stmt != null)
            stmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

}