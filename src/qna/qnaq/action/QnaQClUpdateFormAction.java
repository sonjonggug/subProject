package qna.qnaq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQClDetailService;

public class QnaQClUpdateFormAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		 
	 	ActionForward forward = new ActionForward();
		int qnum=Integer.parseInt(request.getParameter("QNUM"));
		String nowPage = request.getParameter("page");
		QnaQClDetailService qnaQClDetailService = new QnaQClDetailService();	
		QnaQBean article = qnaQClDetailService.getArticle(qnum);
	   	request.setAttribute("article", article);
	   	request.setAttribute("nowPage", nowPage);
   		forward.setPath("/view/qna/qnaQClUpdate.jsp");
   		return forward;
   		
	}

}
