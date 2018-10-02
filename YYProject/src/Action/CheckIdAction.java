package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;

public class CheckIdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// 아이디 중복확인
		request.setCharacterEncoding("UTF-8");
		String inputId = request.getParameter("id");
		int result = new UserDAO().checkId(inputId);	// id가 담겨있는 inputId를 매개변수로 받아서 userDao로 넘겨준다.
		
		response.getWriter().println(result);
		// getWriter : jsp 페이지로 result값을 가져가야 하므로 필요하다.
		// jsp페이지로 이동하기 위해 필요
	}
}
