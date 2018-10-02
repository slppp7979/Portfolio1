package Action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import VO.CommentVO;

public class CommentWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String location = request.getParameter("l");
		
		int bNum = Integer.parseInt(request.getParameter("listNum"));
		String userId = (String)request.getSession().getAttribute("sessionID");
		String content = request.getParameter("cContent");
		int cStar = Integer.parseInt(request.getParameter("cStar"));
		
		CommentVO vo = new CommentVO();
		vo.setcReg_flag(bNum);
		vo.setcId(userId);
		vo.setcContent(content);
		vo.setcStar(cStar);
		
		CommentDAO dao = new CommentDAO();
		dao.commentInsert(vo);
		
		dao.finally_close();
		
		response.sendRedirect("/YYProject/user?actionName=list&l="+URLEncoder.encode(location, "UTF-8"));
	}
}
