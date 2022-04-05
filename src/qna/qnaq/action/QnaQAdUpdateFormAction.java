package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import qna.bean.QnaQBean;
import qna.qnaq.svc.QnaQClDetailService;

public class QnaQAdUpdateFormAction implements Action {

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
		String nowPage = request.getParameter("page");
		QnaQClDetailService qnaQClDetailService = new QnaQClDetailService();	
		QnaQBean article = qnaQClDetailService.getArticle(qnum);
	   	request.setAttribute("article", article);
	   	request.setAttribute("nowPage", nowPage);
   		forward.setPath("/view/qna/qnaQAdUpdate.jsp");
   		return forward;
   		
		}
		return forward;
	}
}
