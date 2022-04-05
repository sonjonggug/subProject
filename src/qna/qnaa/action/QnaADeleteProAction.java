package qna.qnaa.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import qna.bean.QnaABean;
import qna.qnaa.svc.QnaADeleteProService;
import qna.qnaa.svc.QnaAWriteProService;

public class QnaADeleteProAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		ActionForward forward=null;
		QnaABean qnaABean = null;
		HttpSession session = request.getSession();
		String nowPage = request.getParameter("page");
   		int QNUM = Integer.parseInt(request.getParameter("QNUM"));
   		qnaABean = new QnaABean();
   		qnaABean.setAREP(QNUM);
   		qnaABean.setAID((String)session.getAttribute("id"));
   		qnaABean.setACON(request.getParameter("ACON"));
		QnaADeleteProService qnaADeleteProService = new QnaADeleteProService();
		boolean isReplyDelete = qnaADeleteProService.deleteQnaA(qnaABean);
		
		if(!isReplyDelete){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답변이 있어 삭제가 불가능합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}
			else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("qnaQAdDetail.qn?QNUM="+QNUM+"&page="+nowPage);
			}

		return forward;
	
	}  	
}
