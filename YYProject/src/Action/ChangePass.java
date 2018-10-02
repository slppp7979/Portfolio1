package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;

public class ChangePass implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String password = request.getParameter("password");
		
		// 입력한 비밀번호와 현재 사용자의 비번이 맞는지 확인
		String id = (String)request.getSession().getAttribute("sessionID");
		
		FoodWriteDAO dao = new FoodWriteDAO();
		
		// 아이디와 비밀번호가 일치하는지 확인하기 위해 두 매개변수를 받아간다.
		int result = dao.changePass(password, id);
		
		dao.finally_close();
		
		response.getWriter().println(result); 	// mypage ajax로 넘어감
		// ajax를 사용하고 돌려받을 변수가 있으면 println에 담아간다.
		
		//JSONArray, JSONObject
	    //Javascript Object Notation(객체를 주고받는다는 뜻)
	      
	    //result가 1인지 0인지가 넘어온다. 1이면 rs.next()가 있었단 뜻이므로 일치한단 뜻임
	}

}
