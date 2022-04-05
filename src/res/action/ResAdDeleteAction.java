package res.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import res.service.ResAdDeleteService;

public class ResAdDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		String deleteId=request.getParameter("rnum");
		String fieldName=request.getParameter("fieldName");
		String nowPage = request.getParameter("page");
		String viewId = request.getParameter("id");

		ActionForward forward = null;
		if(id==null){
			response.setContentType("text/html;charset=UTF-8");
	   		PrintWriter out = response.getWriter();
			out.println("<script>");
	   		out.println("location.href='/mycar/admin.me'");
	   		out.println("</script>");
		
		} else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='/mycar/admin.me'");
			out.println("</script>");
			
		}else if(viewId.equals("")){
			ResAdDeleteService resDeleteService = new ResAdDeleteService();
			boolean deleteResult=resDeleteService.resAdDelete(deleteId);

			if(deleteResult){
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./resAdListAction.re?page="+nowPage);
				
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("location.href='./resAdListAction.re';");
				out.println("</script>");
			}return forward;
		
		}
		else{
			
			ResAdDeleteService resDeleteService = new ResAdDeleteService();
			boolean deleteResult=resDeleteService.resAdDelete(deleteId);

			if(deleteResult){
				forward = new ActionForward();
				forward.setRedirect(true);
				String url=URLEncoder.encode(viewId,"UTF-8");
				forward.setPath("./resAdSearchAction.re?id="+url+ "&&fieldName="+fieldName+"&&page="+nowPage);
				 
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("location.href='/mycar/admin.me'");
				out.println("</script>");
			}
		}
		return forward;
	}
}