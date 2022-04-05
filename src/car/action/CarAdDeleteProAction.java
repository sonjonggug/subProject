package car.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import car.service.CarDeleteProService;
import main.Action;
import main.ActionForward;
import javax.servlet.http.HttpSession;
import java.io.File;
public class CarAdDeleteProAction implements Action {

	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) 
			throws Exception{	 

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ActionForward forward = null;
		System.out.print("관리자 Delete Action: ");
		System.out.println(id);
		
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='./carIdCheck.ca';");
			out.println("</script>");
		
		}else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='./carIdCheck.ca';");
			out.println("</script>");		
		}else {
		String cCode=request.getParameter("cCode");
		String cFile = request.getParameter("cFile");
		String nowPage = request.getParameter("page");
		String fieldName = request.getParameter("fieldName");
		String word = request.getParameter("word");
		System.out.println(word);
		CarDeleteProService carDeleteProService = new CarDeleteProService();
		System.out.print("DeleteAction /Admin 조건 통과 후 cFile: ");
		System.out.println(cFile);
		System.out.print("DeleteAction /Admin 조건 통과 후 cCode: ");
		System.out.println(cCode);
		System.out.print("DeleteAction /Admin 조건 통과 후 nowPage: ");
		System.out.println(nowPage);
			boolean isDeleteSuccess = carDeleteProService.removeCar(cCode);
			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('CarDeleteProAction Delete 실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else{
				String filePath = "C:\\mycar\\mycar\\WebContent\\image\\";
				String fileName = cFile;
				filePath +=fileName;
				System.out.println(filePath);
				File file = new File(filePath);
				if(file.exists()){
		    		if(file.delete()){
		    			System.out.println("파일삭제 성공");
		    		}else{
		    			System.out.println("파일삭제 실패");
		    		}
		    	}else{
		    		System.out.println("파일이 존재하지 않습니다.");
		    	}
		        	
			}
				forward = new ActionForward();
                forward.setRedirect(true);//여기서 한글 깨짐 
                String url = URLEncoder.encode(word, "UTF-8");
                forward.setPath("carAdSearchList.ca?page=" + nowPage+ "&&fieldName=" + fieldName + "&&word=" + url);
			}
		
		return forward;
	
	}
}