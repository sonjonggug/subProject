package res.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import car.bean.CarBean;
import main.Action;
import main.ActionForward;
import res.bean.ResClCheckBean;
import res.service.ResClDetailService;

public class ResClDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		HttpSession session = request.getSession();
		String rid = (String)session.getAttribute("id");
		String rCode = request.getParameter("rcode");
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		//String page = request.getParameter("page");
		ActionForward forward = null;
		if(rid==null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./resClLogin.re");
		} else {
			ResClDetailService resClDetailService = new ResClDetailService();
			ResClCheckBean resclckbean = resClDetailService.getRes(rnum);
			CarBean carbean = resClDetailService.getCar(rCode);
			forward = new ActionForward();
			//request.setAttribute("page", page);
			request.setAttribute("resclckbean", resclckbean);
			request.setAttribute("carbean", carbean);
			forward.setPath("/view/res/resClDetail.jsp");
   		
		}
		return forward;
		
	 } 
}
