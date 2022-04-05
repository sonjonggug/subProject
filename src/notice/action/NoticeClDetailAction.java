package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.service.NoticeDetailService;

 public class NoticeClDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int nNUM=Integer.parseInt(request.getParameter("nNUM"));
		String page = request.getParameter("page");
		
		request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
		System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
		
		NoticeDetailService noticeDetailService = new NoticeDetailService();
		NoticeBean article = noticeDetailService.getArticle(nNUM);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/view/notice/noticeClView.jsp");
   		return forward;

	 }
	 
}