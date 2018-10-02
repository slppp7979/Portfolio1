package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.FoodWriteDAO;
import VO.FoodWriteVO;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String directory = request.getRealPath("/upload/");
		int size = 1024*1024*100;
		String enc = "utf-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, directory, size, enc, new DefaultFileRenamePolicy());
			// request도 넣어준다. 
			
			Enumeration fileNames = multi.getFileNames();
			
			FoodWriteVO vo = new FoodWriteVO();
			vo.setbName(multi.getParameter("bName"));	// request가 multi안에 들어있으니깐.
			vo.setbTel(multi.getParameter("bTel"));
			vo.setbTime(multi.getParameter("bTime"));
			vo.setbAdd1(multi.getParameter("bAdd1"));
			vo.setbAdd2(multi.getParameter("bAdd2"));
			vo.setbLocation(multi.getParameter("bLocation"));
			
			String[] temp = multi.getParameterValues("bKind");
			
			String bKind = temp[0];
			
			for(int i=1; i<temp.length; i++) {
				bKind += "_"+temp[i];
			}
			
			vo.setbMenu1_Detail(multi.getParameter("bMenu1-Detail"));
			vo.setbMenu2_Detail(multi.getParameter("bMenu2-Detail"));
			vo.setbMenu3_Detail(multi.getParameter("bMenu3-Detail"));
			vo.setbInfo(multi.getParameter("bInfo"));
			vo.setbStar(Integer.parseInt(multi.getParameter("bStar")));
			
			String[] tags = multi.getParameterValues("hashTag"); // food-write.jsp의 쿼리에서 추가한 tags의 input type=hidden name값
			
			String bHash = tags[0];	// 첫번째는 _안붙으니깐 
			
			for(int i=1 ; i<tags.length ; i++) {
				bHash += "_"+tags[i];	// "0_a_b_c_d"
			}
			vo.setbHash(bHash);
			
			String[] uploadFiles = new String[4];
			
			int count = 0;
			
			while(fileNames.hasMoreElements()) {
				String file = (String)fileNames.nextElement();
				String fileName = multi.getOriginalFileName(file);
				uploadFiles[count++] = multi.getFilesystemName(file);
				if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".jpeg") && !fileName.endsWith(".gif")) {
					File upFile = new File(directory + multi.getFilesystemName(file));
					upFile.delete();
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('업로드할 수 없는 확장자 입니다.)");
					script.println("history.back()");
					script.println("</script>");
					
				}
			}
			
			vo.setbImg(uploadFiles[0]);
			vo.setbMenu1_Img(uploadFiles[1]);
			vo.setbMenu2_Img(uploadFiles[2]);
			vo.setbMenu3_Img(uploadFiles[3]);
			
			FoodWriteDAO dao = new FoodWriteDAO();
			dao.insert(vo, bKind);
			
			// doPost방식은 상관없지만, doGet방식은 한글변환을 해줘야함 (vo.getbAdd1()를 받아서 "utf-8"로 바꿔준다.)
			response.sendRedirect("/YYProject/user?actionName=list&l="+URLEncoder.encode(vo.getbAdd1(), "UTF-8"));
			// l에다가 vo.getbAdd1()을 담아서 FoodListAction으로 보내준다.
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
}
