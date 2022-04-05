package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberClLoginService;

public class MemberClLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();	   		
 		
	   		member.setMid(request.getParameter("mid"));
	   		member.setMpw(request.getParameter("mpw"));
	   		
	   		MemberClLoginService memberClLoginService = new MemberClLoginService();
	   		boolean loginResult = memberClLoginService.login(member);
	   		ActionForward forward = null;
	   		
	   		System.out.println("로그인한 id = " + member.getMid());
	   		
	   		if(member.getMid().equals("admin")) {
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('관리자 계정으로 접속하였습니다.');");
		   		out.println("location.href='./admin.me';");
		   		out.println("</script>");
	   		} else if(loginResult){
	   	    forward = new ActionForward();
	   		session.setAttribute("id", member.getMid());
	   		forward.setRedirect(true);
	   			if(request.getQueryString() != null) {
	   			forward.setPath(request.getQueryString().substring(8));
	   			} else {
	   			forward.setPath("./");
	   			}
	   		}
	   		else{
	   			response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		System.out.println("로그인 실패");
		   		out.println("<script>");
		   		out.println("history.back()");
		   		out.println("</script>");
	   		}
	   		return forward;
	}
}