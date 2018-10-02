package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;

public class FindChangePass implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		response.setContentType("text/html;charset=utf-8");
		
		String pass = request.getParameter("password");
		String id = (String)request.getSession().getAttribute("sessionID");		// session은 항상 object라서 형변환해준다.
		
		FoodWriteDAO dao = new FoodWriteDAO();
		int result = dao.findChangePass(pass, id);
		
		if(result ==1) {
			// 아이디가 중복이 없으니까 항상 최대값이 1이다 -> 그래서 1로 리턴하지 않아도 1로 비교할 수 있다.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 변경되었습니다.')");
			script.println("location.href='main-food.jsp'");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 변경하지 못하였습니다.')");
			script.println("location.href='mypage.jsp'");
			script.println("</script>");			
		}
	}
}
