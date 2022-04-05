package member.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberClJoinService;

public class MemberClJoinAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	
		 	MemberBean member=new MemberBean();
	   		boolean joinResult=false;
	   			   		
	   		member.setMid(request.getParameter("mid"));
	   		member.setMpw(request.getParameter("mpw"));
	   		member.setMname(request.getParameter("mname"));
	   		member.setMbirth(request.getParameter("mbirth"));
	   		member.setMhp(request.getParameter("mhp"));
	   		member.setMaddrp(request.getParameter("maddrp"));	   		
	   		member.setMaddr(request.getParameter("maddr"));
	   		member.setMaddrd(request.getParameter("maddrd"));
	   		member.setMemail(request.getParameter("memail"));
	   		member.setMlic(request.getParameter("mlic"));
	   		member.setMid(request.getParameter("mid"));
	   		System.out.println(request.getParameter("mpw"));
	   		System.out.println(request.getParameter("mname"));
	   		System.out.println(request.getParameter("mbirth"));
	   		System.out.println(request.getParameter("mhp"));
	   		System.out.println(request.getParameter("maddrp"));	   		
	   		System.out.println(request.getParameter("maddr"));
	   		System.out.println(request.getParameter("maddrd"));
	   		System.out.println(request.getParameter("memail"));
	   		System.out.println(request.getParameter("mlic"));
	   		
	   		MemberClJoinService memberClJoinService = new MemberClJoinService();
	   		joinResult=memberClJoinService.joinMember(member);
	   		
	   		ActionForward forward = null;
	   		if(joinResult==false){
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('회원가입 실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
		   	}
	   		else{
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		forward.setPath("./memberClLogin.me");
	   		}
	   		return forward;
	}
}