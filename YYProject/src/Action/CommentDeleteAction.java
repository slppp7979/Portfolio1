package Action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;

public class CommentDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String location = request.getParameter("l");
		
		int cNum = Integer.parseInt(request.getParameter("c"));	 // location-food의 삭제버튼으로 받은 c
		
		CommentDAO dao = new CommentDAO();
		dao.commentDelete(cNum);
		
		dao.finally_close();
		
		response.sendRedirect("/YYProject/user?actionName=list&l="+URLEncoder.encode(location, "UTF-8"));
	}
}
