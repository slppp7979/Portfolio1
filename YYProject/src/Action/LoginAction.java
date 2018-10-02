package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FoodWriteDAO;
import DAO.UserDAO;
import VO.UserVO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		// 변수 넣어준다.
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		
		UserDAO dao = new UserDAO();
		
		// 사용자가 있는지 확인하기 위하여 boolean 사용한다.
		boolean isLogin = dao.login(id, password);	// dao에 id, password 넘겨준다.
		
		dao.finally_close();
		
		// 세션준비
		HttpSession session = request.getSession();
		
		if(isLogin == true) {
			session.setAttribute("sessionID", id);
			dao.finally_close();
			response.sendRedirect("/YYProject/main-food.jsp");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.')");
			script.println("location.href='main-food.jsp'");
			script.println("</script>");
		}
	}
} 
