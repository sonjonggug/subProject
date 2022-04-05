package car.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.bean.CarBean;
import car.service.CarAdDetailProService;
import main.Action;
import main.ActionForward;

 public class CarAdDetailProAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			ActionForward forward = null;
			System.out.print("관리자 AdDetailPro Action: ");
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
		 
		 String cCode =request.getParameter("cCode");
		String page = request.getParameter("page");
		CarAdDetailProService carDetailService = new CarAdDetailProService();
		CarBean car = carDetailService.getArticle(cCode);
		forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("car", car);
   		forward.setPath("/view/car/carAdViewPro.jsp");
   		
	 }
		return forward;
	 }
}