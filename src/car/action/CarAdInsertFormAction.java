package car.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;

public class CarAdInsertFormAction implements Action {

	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		   	
		 HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			ActionForward forward = null;
			System.out.print("관리자 InsertForm Action: ");
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
			
		    String page = request.getParameter("page");
			forward = new ActionForward();
			request.setAttribute("page", page);
		   	forward.setPath("/view/car/carAdInsert.jsp");
	   		System.out.println(forward);
			}
	   		return forward;
		 }
		 
}
