package Action;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import DAO.FoodWriteDAO;
import VO.CommentVO;
import VO.FoodWriteVO;

public class FoodListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("UTF-8");
		
		//한글 처리 (FoodWriteServlet)
		String location = URLDecoder.decode(request.getParameter("l"), "UTF-8");
		
		FoodWriteDAO dao = new FoodWriteDAO();
		ArrayList<FoodWriteVO> blist = dao.getFoodList(location);
		CommentDAO cdao = new CommentDAO();
		ArrayList<CommentVO> clist = cdao.getCommentList();
		ArrayList<FoodWriteVO> list = cdao.getScore(blist);	
		
		request.setAttribute("list", list);
		request.setAttribute("title", location);
		request.setAttribute("clist", clist);
		
		dao.finally_close();
		cdao.finally_close();
		
		RequestDispatcher rd = request.getRequestDispatcher("location-food.jsp");
		rd.forward(request, response);	
	}

}
