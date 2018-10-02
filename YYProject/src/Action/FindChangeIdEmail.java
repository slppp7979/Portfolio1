package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;

public class FindChangeIdEmail implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// 세션에 저장된 아이디말고 입력한 아이디이기 때문에 getParameter로 받아옴 ajax의 id, email과 같음
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		FoodWriteDAO dao = new FoodWriteDAO();
		
		int result = dao.findChangeIdEmail(id, email);
		
		dao.finally_close();
		
		if(result==1) {
			request.getSession().setAttribute("sessionID", id);
			// findChangePass에서 사용해야하므로 요청함
			// 해당 세션 아이디의 비밀번호를 변경해야하므로 sessionID에 id를 세팅해준다.
		}
		response.getWriter().println(result);	// result를 넘겨서 ajax로 간다.
	}
}
