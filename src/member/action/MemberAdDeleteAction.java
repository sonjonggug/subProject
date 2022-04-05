package member.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.service.MemberAdDeleteService;

public class MemberAdDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		String id=(String)session.getAttribute("id");
		
		String deleteId=request.getParameter("id");
		String fieldName=request.getParameter("fieldName");
		String nowPage = request.getParameter("page");
		String viewId = request.getParameter("viewId");

		ActionForward forward = null;
		if(id==null){
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberAdLogin.me");
		}else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('관리자는삭제 x')");
			out.println("location.href='./memberLogin.me';");
			out.println("</script>");
		}else if(viewId.equals("")){
			MemberAdDeleteService memberDeleteService = new MemberAdDeleteService();
			boolean deleteResult=memberDeleteService.deleteMember(deleteId);

			if(deleteResult){
				
		   		
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./memberAdListAction.me?page="+nowPage);
				//forward.setPath("./memberAdSearchAction.me?id="+viewId+ "&&fieldName="+fieldName+"&&page="+nowPage);
				 
			}else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('ȸ���������� ����.');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}return forward;
		}
		else{
			
			
			MemberAdDeleteService memberDeleteService = new MemberAdDeleteService();
			boolean deleteResult=memberDeleteService.deleteMember(deleteId);

			if(deleteResult){
				
		   		
				forward = new ActionForward();
				forward.setRedirect(true);
				//forward.setPath("./memberAdListAction.me");
				String url=URLEncoder.encode(viewId,"UTF-8");
				forward.setPath("./memberAdSearchAction.me?id="+url+ "&&fieldName="+fieldName+"&&page="+nowPage);
				 
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('ȸ���������� ����.');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}
		}
		return forward;
	}
}