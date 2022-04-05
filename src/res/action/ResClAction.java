package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;

public class ResClAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String rid = (String)session.getAttribute("id");
		String cCode = request.getParameter("cCode");
		String nowPage = request.getParameter("page");
		String cType = request.getParameter("ctype");
		String cSize = request.getParameter("csize");
		ActionForward forward = null;
		
		request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
		System.out.println("현재 URI 값은 " + request.getRequestURI());
		System.out.println("현재 쿼리스트링 값은 " + request.getQueryString());
		
		if(rid==null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./resClLogin.re");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./resClWrite.re?ctype="+cType+"&csize="+cSize+"&cCode="+cCode+"&page="+nowPage);
		}
		return forward;
	
	}
}
