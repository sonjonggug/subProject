package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberAdLoginService;

public class MemberAdLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
		 	//Session이 존재하면 현재 Session을 반환하고 존재하지 않으면 새로이 세션을 생성
			ActionForward forward = null;
	   	    forward = new ActionForward();
		 	MemberBean member=new MemberBean();
	   		
	   		member.setMid(request.getParameter("MID"));
	   		member.setMpw(request.getParameter("MPW"));
	   		
	   		MemberAdLoginService memberAdLoginService = new MemberAdLoginService();
		   	boolean loginResult = memberAdLoginService.login(member);
	   		
	   		if(member.getMid()==null) {
	   			response.setContentType("text/html;charset=utf8");
	   			PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('관리자가 아닙니다.');");
		   		out.println("location.href='./admin.me';");
		   		out.println("</script>");
			
	   		}else if(!member.getMid().equals("admin")){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('관리자가 아닙니다.');");
		   		out.println("location.href='./admin.me';");
		   		out.println("</script>"); 
   		
	   		}else if(loginResult){
	   
	   		session.setAttribute("id", member.getMid());
	   		forward.setRedirect(true);
	   		//forward.setPath("./memberAdListAction.me");
	   		forward.setPath("./resAdListAction.re");
	   		
	   			}
	   		else{
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('아이디나 비밀번호가 일치하지않습니다.');");
		   		out.println("location.href='./admin.me';");
		   		out.println("</script>"); 
		   		
	   		}
	   		return forward;
	}
}