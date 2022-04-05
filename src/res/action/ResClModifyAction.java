package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import res.bean.ResClBean;
import res.service.ResClModifyService;

public class ResClModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String rid = (String)session.getAttribute("id");
		ActionForward forward = null;
		ResClBean resClBean = null;
		int rnum=Integer.parseInt(request.getParameter("rnum"));
		
		resClBean = new ResClBean();
		resClBean.setRnum(rnum);
		resClBean.setRid(rid);
		resClBean.setRcode(request.getParameter("rcode"));
		resClBean.setRstart(request.getParameter("rstart"));
		resClBean.setRend(request.getParameter("rend"));
		ResClModifyService resclmoservice = new ResClModifyService();
		boolean isResmoSuccess = resclmoservice.resClmo(resClBean);
			
		if(!isResmoSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약변경실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./resClDetail.re?rnum="+rnum+"&page=1");
		}
		return forward;
	}
	
}

