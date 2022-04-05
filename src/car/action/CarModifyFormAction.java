package car.action;

import java.io.File;
import java.io.PrintWriter;
import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import car.service.CarFileDupliTest;
import car.bean.CarBean;
import car.service.CarAdModifyProService;
import main.Action;
import main.ActionForward;

public class CarModifyFormAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ActionForward forward = null;
		System.out.print("관리자 AdInsert Action: ");
		System.out.println(id);
		
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 해주시기 바랍니다.')");
			out.println("location.href='./admin.me';");
			out.println("</script>");
		
		}else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.')");
			out.println("location.href='./admin.me';");
			out.println("</script>");		
		}
		else {
		boolean isModifySuccess = false;
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
		String cCode = multi.getParameter("CarCode");
		String fieldName = multi.getParameter("fieldName");
		String word = multi.getParameter("word");
		//CarFileDupliTest DupliTest = new CarFileDupliTest();
		//String result = DupliTest.FileDupliTest(cFile);
		//System.out.println(result);
		System.out.println(page);
		System.out.println(cCode);
		carBean = new CarBean();
		System.out.print("파일 업로드 전 경로");
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
		CarAdModifyProService carModifyProService = new CarAdModifyProService();
		isModifySuccess = carModifyProService.modifyArticle(carBean);
		System.out.println(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		System.out.println(realFolder);
		System.out.println(isModifySuccess);
			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				String cFile = request.getParameter("cFile");
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
				forward.setRedirect(true);
				forward.setPath("./carAdDetail.ca?cCode="+cCode+"&&page="+ page+"&&fieldName="+fieldName+"&&word="+word); 
				
			}
		return forward;

	}
}