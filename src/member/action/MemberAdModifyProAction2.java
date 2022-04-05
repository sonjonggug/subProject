package member.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.service.MemberAdModifyProService;

public class MemberAdModifyProAction2 implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
           
		ActionForward forward = null;
		boolean isModifySuccess = false;
		MemberBean article=new MemberBean();
		String id=(request.getParameter("MID"));
		String fieldName=request.getParameter("fieldName");
		String nowPage = request.getParameter("page");
		String viewId = request.getParameter("viewId");
	   
		MemberAdModifyProService boardModifyProService2 = new MemberAdModifyProService();
		   
		    article.setMid(request.getParameter("MID"));
			article.setMname(request.getParameter("MNAME"));
			article.setMbirth(request.getParameter("MBIRTH"));
			article.setMhp(request.getParameter("MHP"));
			article.setMaddr(request.getParameter("MADDR"));
			article.setMaddrd(request.getParameter("MADDRD"));
			article.setMaddrp(request.getParameter("MADDRP"));
			article.setMemail(request.getParameter("MEMAIL"));
			article.setMlic(request.getParameter("MLIC"));
			
			isModifySuccess = boardModifyProService2.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('��������');");
				out.println("history.back()");
				out.println("</script>");
			}else if(viewId.equals("")){
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./memberAdListAction.me?page="+nowPage);
			}else{
				forward = new ActionForward();
				forward.setRedirect(true);
			//	forward.setPath("./member_info.jsp"); 
			//	forward.setPath("./memberAdViewAction.me?id="+id);
			//	forward.setPath("./memberAdListAction.me");
				String url=URLEncoder.encode(viewId,"UTF-8");
				forward.setPath("./memberAdSearchAction.me?id="+url+ "&&fieldName="+fieldName+"&&page="+nowPage);
			}

		

		return forward;
	}

}