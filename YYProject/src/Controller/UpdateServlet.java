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

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String directory = request.getRealPath("/upload/");	// 경로를 정해준다 => upload
		int size = 1024*1024*100;	// 1024*2하면 메가바이트 => 100메가  
		String enc = "utf-8";	// 파일을 업로드할 때  한글처리
		
		try {
			MultipartRequest multi = new MultipartRequest(request, directory, size, enc, new DefaultFileRenamePolicy());
			// 파일 업로드해주는 함수. (순서 중요). DefaultFileRenamePolicy() -> a.jpg, a(1).jpg, a(2).jpg...
			
			Enumeration fileNames = multi.getFileNames();
			// 파일이 한 개 이상일 때 차곡차곡 넣음
			
			FoodWriteVO vo = new FoodWriteVO();
			vo.setbNum(Integer.parseInt(multi.getParameter("bNum")));	// Upload 그대로 가져와서 bNum가 없었음. int 형변환.
			vo.setbName(multi.getParameter("bName"));
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
			
			String[] tags = multi.getParameterValues("hashTag"); // food-write.jsp의 쿼리에서 추가한 tags의 input type=hidden name값
			
			String bHash = tags[0];	// 첫번째는 _안붙으니깐 
			
			for(int i=1 ; i<tags.length ; i++) {
				bHash += "_"+tags[i];	// "0_a_b_c_d"
			}
			vo.setbHash(bHash);
			vo.setbStar(Integer.parseInt(multi.getParameter("bStar")));
			
			String[] uploadFiles = new String[4];
			// 전체 업로드할 파일이 4개
			
			int count = 0;
			
			while(fileNames.hasMoreElements()) {	// 0에서 시작 다음꺼 있어없어	
				String file = (String)fileNames.nextElement();	// 첫번째
				String fileName = multi.getOriginalFileName(file);
				uploadFiles[count++] = multi.getFilesystemName(file);
				if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png") && !fileName.endsWith(".jpeg") && !fileName.endsWith(".gif")) {
					File upFile = new File(directory + multi.getFilesystemName(file));
					upFile.delete();	// document파일 올리면 얘가 지움
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('업로드할 수 없는 확장자 입니다.)");
					script.println("history.back()");	// 뒤로가기
					script.println("</script>");
					
				}
			}
			
			vo.setbImg(uploadFiles[0]);
			vo.setbMenu1_Img(uploadFiles[1]);
			vo.setbMenu2_Img(uploadFiles[2]);
			vo.setbMenu3_Img(uploadFiles[3]);
			
			FoodWriteDAO dao = new FoodWriteDAO();
			dao.boardUpdate(vo, bKind);
			
			// doPost방식은 상관없지만, doGet방식은 한글변환을 해줘야함 (vo.getbAdd1()를 받아서 "utf-8"로 바꿔준다.)
			response.sendRedirect("/YYProject/user?actionName=list&l="+URLEncoder.encode(vo.getbAdd1(), "UTF-8"));
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
}
