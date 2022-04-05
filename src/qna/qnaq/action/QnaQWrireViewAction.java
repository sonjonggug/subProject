package qna.qnaq.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.ActionForward;
import main.Action;

public class QnaQWrireViewAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 	
				 	HttpSession session=request.getSession();
			   		String id=(String)session.getAttribute("id");
			   		request.setAttribute("fromURI", request.getRequestURI() + "?" + request.getQueryString());
					System.out.println("현재 fromURI 값은 " + request.getRequestURI() + "?" + request.getQueryString());
			   		ActionForward forward = null;
			   		if(id == null){
			   			response.setContentType("text/html;charset=UTF-8");
				   		PrintWriter out = response.getWriter();
						out.println("<script>");
				   		out.println("location.href='memberClLogin.me?fromURI=" + request.getRequestURI() + "?" + request.getQueryString() + "'");
				   		out.println("</script>");
			   		} else {
			   			forward = new ActionForward();
						forward.setRedirect(true);
						forward.setPath("view/qna/qnaQWrite.jsp");
			   		}
			   		return forward;
			}
		}
