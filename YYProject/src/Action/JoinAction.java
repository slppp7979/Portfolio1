package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;
import DAO.UserDAO;
import VO.UserVO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// 아래의 script태그 안에 있는 한글을 위해 인코딩해준다. 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		// println 사용을 위하여 적어준다.
		
		// 사용자가 입력한 값을 getParameter사용하여 가져와 저장한다.
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		// vo에 위에 선언한 변수를 넣어준다.
		UserVO vo = new UserVO();
		vo.setName(name);
		vo.setId(id);
		vo.setPassword(password);
		vo.setEmail(email);
		
		/* 위에껀 요렇게 줄일 수 있음.
		 vo.setName(request.getParameter("name"));
		 vo.setId(request.getParameter("id");
		 vo.setPassword(request.getParameter("password");
		 vo.setEmail(request.getParameter("email");
		 */
		
		// db와 연결한다.
		int result = new UserDAO().join(vo);
		
		UserDAO dao = new UserDAO();
		dao.finally_close();
		
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입을 축하드립니다.')");
			script.println("location.href='main-food.jsp';");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입에 실패했습니다.')");
			script.println("location.href='main-food.jsp';");
			script.println("</script>");
		}
	}
}
