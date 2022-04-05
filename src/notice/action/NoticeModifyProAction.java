package notice.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.service.NoticeModifyProService;

public class NoticeModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

	 	HttpSession session=request.getSession();
   		String id=(String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		int nNUM=Integer.parseInt(request.getParameter("nNUM"));
		String nowPage = request.getParameter("page");
		boolean isModifySuccess = false;
		NoticeBean noticeBean = new NoticeBean();
		NoticeModifyProService noticeModifyProService = new NoticeModifyProService();

		
   		if(id==null){
   			response.setContentType("text/html;charset=utf8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
			out.println("alert('로그인 해주시기 바랍니다.')");
			out.println("location.href='./admin.me';");
	   		out.println("</script>"); 
   		}else if(!id.equals("admin")){
   			response.setContentType("text/html;charset=utf8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
			out.println("alert('관리자가 아닙니다.')");
			out.println("location.href='./admin.me';");
	   		out.println("</script>"); 
   		}else{

   		}
			noticeBean.setNNUM(nNUM);
			noticeBean.setNTITLE(request.getParameter("NTITLE"));
			noticeBean.setNCON(request.getParameter("NCON"));
			isModifySuccess = noticeModifyProService.modifyArticle(noticeBean);
			
			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('ErrorError');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("noticeAdDetail.no?nNUM="+nNUM+"&page="+nowPage);

			}
		return forward;
	}
}