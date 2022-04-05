package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.service.MemberClDeleteService;

public class MemberClDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		ActionForward forward = null;
		if(id==null){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		} else {
			String deleteClId=id;
			MemberClDeleteService memberClDeleteService = new MemberClDeleteService();
			boolean deleteResult=memberClDeleteService.memberClDelete(deleteClId);

			if(deleteResult){
				session.invalidate();
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("/mycar");
				System.out.println("È¸¿øÅ»Åð ¿Ï·á");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('È¸¿øÅ»Åð ½ÇÆÐ');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}
		}
		return forward;
	}
}