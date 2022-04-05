package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQWriteProService;

public class QnaQWriteProAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {

		ActionForward forward=null;
		QnaQBean qnaQBean = null;
		HttpSession session=request.getSession();
   		String id=(String)session.getAttribute("id");
		qnaQBean = new QnaQBean();
		qnaQBean.setQID((String)session.getAttribute("id"));
		qnaQBean.setQTITLE(request.getParameter("QTITLE"));
		qnaQBean.setQCON(request.getParameter("QCON"));
		QnaQWriteProService qnaQWriteProService = new QnaQWriteProService();
		boolean isWriteSuccess = qnaQWriteProService.registArticle(qnaQBean);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("qnaQClList.qn");
		}

		return forward;
		
	}  	
	
}
