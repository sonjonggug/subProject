package notice.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import notice.service.NoticeDeleteProService;

public class NoticeDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 
		
	 	HttpSession session=request.getSession();
   		String id=(String)session.getAttribute("id");
   		ActionForward forward = null;
   		
		
   		if(id==null){
   			response.setContentType("text/html;charset=utf8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("location.href='./carIdCheck.ca';");
	   		out.println("</script>"); 
   		}else if(!id.equals("admin")){
   			response.setContentType("text/html;charset=utf8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("location.href='./carIdCheck.ca';");
	   		out.println("</script>"); 
   		}else{
   		forward = new ActionForward();
		int nNUM=Integer.parseInt(request.getParameter("nNUM"));
		String thisPage = request.getParameter("page");

		NoticeDeleteProService noticeDeleteProService = new NoticeDeleteProService();
		boolean isArticleWriter = noticeDeleteProService.deleteArticle(nNUM);
		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 불가');");
			out.println("history.back();");
			out.println("</script>");
			}else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("noticeAdList.no?page="+ thisPage);


			}

	}
		return forward;
   		
}
}