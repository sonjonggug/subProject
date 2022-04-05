package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;

public class ResAdInsertAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 	
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		ActionForward forward = null;
			
	   		if(id==null) {
				response.setContentType("text/html;charset=UTF-8");
		   		PrintWriter out = response.getWriter();
				out.println("<script>");
		   		out.println("location.href='/mycar/admin.me'");
		   		out.println("</script>");
	   		
	   		} else if(!id.equals("admin")) {
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("location.href='/mycar/admin.me'");
		   		out.println("</script>");
	   		
	   		} else {
		   		forward = new ActionForward();
		   		forward.setPath("/view/res/resAdInsert.jsp");
		   		}
		   		return forward;
		}
	}
