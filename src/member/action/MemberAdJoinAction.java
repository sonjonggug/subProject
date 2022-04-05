package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberAdJoinService;

public class MemberAdJoinAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	
		 MemberBean member=new MemberBean();
	   		boolean joinResult=false;
	   		
	   		member.setMid(request.getParameter("MID"));
	   		member.setMpw(request.getParameter("MPW"));
	   		member.setMname(request.getParameter("MNAME"));
	   		member.setMbirth(request.getParameter("MBIRTH"));
	   		member.setMhp(request.getParameter("MHP"));
	   		member.setMaddr(request.getParameter("MADDR"));
	   		member.setMaddrd(request.getParameter("MADDRD"));
	   		member.setMaddrp(request.getParameter("MADDRP"));
	   		member.setMemail(request.getParameter("MEMAIL"));
	   		member.setMlic(request.getParameter("MLIC"));
	   		MemberAdJoinService memberJoinService = new MemberAdJoinService();
	   		joinResult=memberJoinService.joinMember(member);
	   		
	   		ActionForward forward = null;
	   		if(joinResult==false){
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('이미 사용중인 아이디입니다.')");
	   			out.println("history.back()");
	   			out.println("</script>");
		   	}
	   		else{
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		//forward.setPath("./memberLogin.me");
	   		forward.setPath("./memberAdListAction.me");
	   		}
	   		return forward;
	}
}