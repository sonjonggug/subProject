package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberClUpdateService;
import res.bean.PageInfo;
import res.bean.ResClCheckBean;
import res.service.ResClListService;

public class MemberClUpdateAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println("MemberClUpdateAction에서 id의 값 = " + id);
		MemberBean member=(MemberBean)session.getAttribute("member");

		ActionForward forward = null;
		if(id==null){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberClLogin.me");
		} else {
			MemberBean updateClMember=member;

			// MemberClUpdateViewAction 부분
			member.setMid(id);
			member.setMpw(request.getParameter("mpw"));
			member.setMname("코스모");
			member.setMhp(request.getParameter("mhp"));
			member.setMaddr(request.getParameter("maddr"));
			member.setMemail(request.getParameter("memail"));
			member.setMlic(request.getParameter("mlic"));
			
			MemberClUpdateService memberClUpdateService = new MemberClUpdateService();
			boolean updateResult=memberClUpdateService.memberClUpdate(updateClMember);

			if(updateResult){
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("/mycar/memberClViewAction.me?fromURI=" + request.getRequestURI());
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('정보수정 실패');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}
		}
		return forward;
	}
}