package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import res.bean.ResBean;
import res.service.ResAdInsertService;

public class ResAdInsertProAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 	
				 	ResBean resb=new ResBean();
			   		int joinResult = 0;
			   		HttpSession session=request.getSession();
			   		String id=(String)session.getAttribute("id");
			   		
			   		resb.setRid(request.getParameter("rid"));
			   		resb.setRcode(request.getParameter("rcode"));
			   		resb.setRstart(request.getParameter("rstart"));
			   		resb.setRend(request.getParameter("rend"));
			   		System.out.println(request.getParameter("rid"));
			   		System.out.println(request.getParameter("rcode"));
			   		System.out.println(request.getParameter("rstart"));
			   		System.out.println(request.getParameter("rend"));
			   		
			   		ResAdInsertService resAdInsertService = new ResAdInsertService();
			   		joinResult = resAdInsertService.JoinAdRes(resb);
			   		
			   		ActionForward forward = null;
			   		if(id==null) {
						response.setContentType("text/html;charset=UTF-8");
				   		PrintWriter out = response.getWriter();
						out.println("<script>");
				   		out.println("location.href='/mycar/admin.me'");
				   		out.println("</script>");
			   		
			   		} else if(!id.equals("admin")) {
			   			response.setContentType("text/html;charset=euc-kr");
				   		PrintWriter out=response.getWriter();
				   		out.println("<script>");
				   		out.println("location.href='/mycar/admin.me'");
				   		out.println("</script>");
			   		
			   		} else if(joinResult == 0){
			   			response.setContentType("text/html;charset=UTF-8");
			   			PrintWriter out = response.getWriter();
			   			out.println("<script>");
			   			out.println("history.back()");
			   			out.println("</script>");
			   			
				   	} else {
				   	    forward = new ActionForward();
				   		forward.setRedirect(true);
				   		forward.setPath("./resAdListAction.re");
				   		}
				   		return forward;
				}
			}