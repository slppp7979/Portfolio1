package Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;
import VO.FoodWriteVO;

public class SearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
		
		String keyword = request.getParameter("k");
		String type = request.getParameter("t");
		
		ArrayList<FoodWriteVO> list = new ArrayList<FoodWriteVO>();
		
		FoodWriteDAO dao = new FoodWriteDAO();
		
		list = dao.getSearchList(keyword, type);
//		System.out.println(list.size());	// 1이 떠야 하나 들어간거
		
		request.setAttribute("list", list);
		Collections.shuffle(list); // 나오는 리스트들이 랜덤으로 뜨도록 함
		
		if(type.equals("tbName")) {
			request.setAttribute("store", keyword);
		}else {
			request.setAttribute("keyword", keyword);			
		}
		dao.finally_close();
		
		RequestDispatcher rd = request.getRequestDispatcher("location-food.jsp");
		
		rd.forward(request, response);
		
	}

}
