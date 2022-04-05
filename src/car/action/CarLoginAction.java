package car.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import car.service.CarAdLoginService;
import car.bean.CarBean;
import member.bean.MemberBean;
import main.Action;
import main.ActionForward;


public class CarLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		MemberBean member=new MemberBean();
	   		
	   		member.setMid(request.getParameter("MID"));
	   		member.setMpw(request.getParameter("MPW"));
	   		
	   		CarAdLoginService memberLoginService = new CarAdLoginService();
	   		boolean loginResult = memberLoginService.login(member);
	   		ActionForward forward = null;
	   		if(loginResult){
	   	    forward = new ActionForward();
	   		session.setAttribute("id", member.getMid());
	   		forward.setRedirect(true);
	   		forward.setPath("./memberListAction.me");
	   		}
	   		else{
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('로그인 실패');");
		   		out.println("location.href='./memberLogin.me';");
		   		out.println("</script>");
	   		}
	   		return forward;
	}
}