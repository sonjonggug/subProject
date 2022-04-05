package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import res.bean.ResClBean;
import res.service.ResClService;

public class ResClCheckAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String rid = (String)session.getAttribute("id");
		ActionForward forward = null;
		ResClBean resClBean = null;
		
		resClBean = new ResClBean();
		resClBean.setRid(rid);
		resClBean.setRcode(request.getParameter("rcode"));
		resClBean.setRstart(request.getParameter("rstart"));
		resClBean.setRend(request.getParameter("rend"));
		ResClService resclservice = new ResClService();
		boolean isResSuccess = resclservice.resCl(resClBean);
		if(!isResSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/mycar/memberClViewAction.me?page=1");
		}
		return forward;
	}
	
}

