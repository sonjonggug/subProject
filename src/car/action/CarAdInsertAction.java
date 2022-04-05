package car.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import car.bean.CarBean;
import car.service.CarWriteProService;
import main.Action;
import main.ActionForward;

public class CarAdInsertAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ActionForward forward = null;
		System.out.print("관리자 AdInsert Action: ");
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
		}
		else {
				
		CarBean carBean = null;
		String realFolder="";
		String saveFolder="/image";
		int fileSize=5*1024*1024; //5MB 파일 크기 제한
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);  
				MultipartRequest multi=new MultipartRequest(request, realFolder, fileSize, "UTF-8",
				               new DefaultFileRenamePolicy());//MultipartRequest(cos.jar) 파일 업로드 관여, 
		          //DefaultFileRenamePolicy()메서드는 파일이름이 중복될경우 test1과 같이 파일 이름을 rename해주는 역할을 한다.
		String page = multi.getParameter("page");
		carBean = new CarBean();
		carBean.setcCode(multi.getParameter("CarCode"));
		carBean.setcType(multi.getParameter("CarType"));
		carBean.setcSize(multi.getParameter("CarSize"));
		carBean.setcName(multi.getParameter("CarName"));
		carBean.setcPrice(Integer.parseInt(multi.getParameter("CarPrice")));
		carBean.setcGear(multi.getParameter("CarGear"));
		carBean.setcFuel(multi.getParameter("CarFuel"));
		carBean.setcSeat(multi.getParameter("CarSeat"));
		carBean.setcFile(
		multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		CarWriteProService carWriteProService = new CarWriteProService();
		boolean isWriteSuccess = carWriteProService.registCar(carBean);
		System.out.println(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		System.out.println(realFolder);
		System.out.println(isWriteSuccess);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("CarWriteProAction에서 실행실패");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./carAdSearchList.ca?page="+ page);
			System.out.println("CarAdInsertAction에서 실행 성공");
			
		}
	}
		return forward;
		
	}
}