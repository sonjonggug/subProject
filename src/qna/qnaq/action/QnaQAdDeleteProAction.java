package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import qna.qnaq.svc.QnaQAdDeleteProService;
import main.ActionForward;

public class QnaQAdDeleteProAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		int qnum=Integer.parseInt(request.getParameter("QNUM"));
		String nowPage = request.getParameter("page");
		QnaQAdDeleteProService qnaQAdDeleteProService = new QnaQAdDeleteProService();
		boolean isArticleWriter = qnaQAdDeleteProService.deleteQnaQ(qnum);
		
		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답변이 있어 삭제가 불가능합니다.')");
			out.println("location.href='qnaQAdDetail.qn?QNUM=" + qnum + "&page=" + nowPage + "'" );
			out.println("</script>");
		}
			else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("qnaQAdList.qn?page="+ nowPage);
			}

		return forward;
	
	}  	
}
