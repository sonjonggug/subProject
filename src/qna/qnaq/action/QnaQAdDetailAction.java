package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import qna.bean.QnaABean;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQClDetailService;

public class QnaQAdDetailAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception { 
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		ActionForward forward = null;
	   		
	   		if(id == null) {
	   			forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("AdId.qn");
			} else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("location.href='./AdId.qn';");
		   		out.println("</script>"); 
			} else {
		   		 forward = new ActionForward();
		 	
			int qnum=Integer.parseInt(request.getParameter("QNUM"));
			String page = request.getParameter("page");
			QnaQClDetailService qnaQClDetailService = new QnaQClDetailService();
			QnaQBean article = qnaQClDetailService.getArticle(qnum);
			QnaABean reply = qnaQClDetailService.getReply(qnum);
			
			request.setAttribute("page", page);
		   	request.setAttribute("article", article);
		   	request.setAttribute("reply", reply);
	   		forward.setPath("/view/qna/qnaQAdDetail.jsp");
			}
	   		return forward;

		 }

}