package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.service.NoticeDetailService;

 public class NoticeDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int nNUM=Integer.parseInt(request.getParameter("nNUM"));
		String page = request.getParameter("page");
		NoticeDetailService noticeDetailService = new NoticeDetailService();
		NoticeBean article = noticeDetailService.getArticle(nNUM);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/view/notice/noticeView.jsp");
   		return forward;

	 }
	 
}