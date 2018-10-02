package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FoodWriteDAO;
import VO.FoodWriteVO;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String bNum = request.getParameter("bNum");
		
		FoodWriteDAO dao = new FoodWriteDAO();
		
		FoodWriteVO vo = dao.boardUpdateForm(bNum);	// 반환형이 vo니까 담아줌
		
		request.setAttribute("list", vo);	// request안에 vo를 담아서 보내줌
		
		RequestDispatcher rd = request.getRequestDispatcher("food-update.jsp");
		rd.forward(request, response);	// request에 세팅된 값을 보냄 
		
	}

}
