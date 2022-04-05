package qna.qnaq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import qna.bean.QnaABean;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQClDetailService;
import main.ActionForward;

public class QnaQClDetailAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		   	
			int qnum=Integer.parseInt(request.getParameter("QNUM"));
			String page = request.getParameter("page");
			
			request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
			System.out.println("���� fromURI ���� " + request.getRequestURI() + "?" + request.getQueryString());
			
			QnaQClDetailService qnaQClDetailService = new QnaQClDetailService();
			QnaQBean article = qnaQClDetailService.getArticle(qnum);
			QnaABean reply = qnaQClDetailService.getReply(qnum);
			ActionForward forward = new ActionForward();
			request.setAttribute("page", page);
		   	request.setAttribute("article", article);
		   	request.setAttribute("reply", reply);
	   		forward.setPath("/view/qna/qnaQClDetail.jsp");
	   		return forward;

		 }

}
