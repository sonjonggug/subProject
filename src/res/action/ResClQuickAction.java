package res.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;

public class ResClQuickAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String rid = (String)session.getAttribute("id");
		ActionForward forward = null;
		
		request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
		System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
		
		if(rid==null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/mycar/memberClLogin.me?fromURI=/mycar/resClQuickForm.re");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/mycar/resClQuickForm.re");
		}
		return forward;
	
	}
}
