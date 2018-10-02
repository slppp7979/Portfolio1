package Action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// 해당 bNum값 받아온다.
		String bNum = request.getParameter("bNum");
		// location값 받아온다. (삭제한 그 지역의 페이지르 넘거가기 위해 지역을 받아옴)
		String location = request.getParameter("l");
		
		// dao 메서드 연결
		FoodWriteDAO dao = new FoodWriteDAO();
		dao.boardDelete(bNum);
		
		// 메서드 종료 후, 해당 location-food창으로 이동
		response.sendRedirect("/YYProject/foodWrite?actionName=list&l="+URLEncoder.encode(location, "UTF-8"));
		// l에다가 location을 담아서 FoodListAction으로 보내준다.
	}
}
