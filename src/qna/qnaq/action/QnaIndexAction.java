package qna.qnaq.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaIndexService;

public class QnaIndexAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		 
		ArrayList<QnaQBean> articleList = new ArrayList<QnaQBean>();
		
		QnaIndexService QnaIndexService = new QnaIndexService();
		articleList = QnaIndexService.getIndexArticle();
		request.setAttribute("articleList", articleList);
		ActionForward forward= new ActionForward();
  		forward.setPath("./");
  		return forward;
	 }
}
