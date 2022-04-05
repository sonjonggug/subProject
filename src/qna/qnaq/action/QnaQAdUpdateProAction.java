package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQClUpdateProService;

public class QnaQAdUpdateProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward forward = null;
		boolean isModifySuccess = false;
		int qnum=Integer.parseInt(request.getParameter("QNUM"));
		QnaQBean qnaQBean = new QnaQBean();
		String nowPage = request.getParameter("page");
		QnaQClUpdateProService qnaQClUpdateProService = new QnaQClUpdateProService();

		try {
			qnaQBean.setQNUM(qnum);
			qnaQBean.setQTITLE(request.getParameter("QTITLE"));
			qnaQBean.setQCON(request.getParameter("QCON")); 
			isModifySuccess = qnaQClUpdateProService.updateQnaQ(qnaQBean);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('답변이 있어 수정이 불가능합니다.');");
				out.println("location.href='qnaQAdDetail.qn?QNUM=" + qnum + "&page=" + nowPage + "'");
				out.println("</script>");
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("qnaQAdDetail.qn?QNUM="+qnum+"&page="+nowPage); 
			}

		} finally { }

		return forward;
	}

}