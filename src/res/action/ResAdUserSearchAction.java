package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import res.service.ResAdUserSearchService;

public class ResAdUserSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ActionForward forward = null;
		forward = new ActionForward();
		
		if(id==null) {
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='/mycar/admin.me'");
			out.println("</script>");
		
		}else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("location.href='/mycar/admin.me'");
			out.println("</script>");		
		
		} else {
			String viewId=request.getParameter("rid");
			System.out.println("ResAdUserSearchAction에서 rid값 " + request.getParameter("rid"));
	   		ResAdUserSearchService userSearchService = new ResAdUserSearchService();
	   		MemberBean user = userSearchService.getMember(viewId);
			
	   		request.setAttribute("user", user);
	   		
	   		forward.setPath("/view/res/resAdCarSearch.jsp");
			}
			return forward;
		}
	}