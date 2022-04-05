package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import qna.qnaq.svc.QnaQClDeleteProService;
import main.ActionForward;

public class QnaQClDeleteProAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int qnum=Integer.parseInt(request.getParameter("QNUM"));
		String nowPage = request.getParameter("page");
		QnaQClDeleteProService qnaQClDeleteProService = new QnaQClDeleteProService();
		boolean isArticleWriter = qnaQClDeleteProService.deleteQnaQCl(qnum);
		
		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답변이 있어 삭제가 불가능합니다.')");
			out.println("location.href='qnaQClDetail.qn?QNUM=" + qnum + "&page=" + nowPage + "'");
			out.println("</script>");
		}
			else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("qnaQClList.qn?page="+ nowPage);
			}

		return forward;
	
	}  	
}
