package notice.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.service.NoticeIndexService;

public class NoticeIndexAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<NoticeBean> articleList=new ArrayList<NoticeBean>();
		
		NoticeIndexService noticeIndexService = new NoticeIndexService();
		articleList = noticeIndexService.getIndexArticle();
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
   		forward.setPath("./");
   		return forward;
	 }
}