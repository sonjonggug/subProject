package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import qna.bean.QnaQBean;
import res.bean.ResBean;
import res.service.ResAdViewProService;

public class ResAdViewProAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		String nowPage = request.getParameter("page");
	   		ResBean resBean = new ResBean();
	   		
	   		ActionForward forward = null;
	   		if(id==null){
	   			forward = new ActionForward();
				forward.setPath("location.href='/mycar/admin.me'");
	   		
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("location.href='/mycar/admin.me'");
		   		out.println("</script>");
	   		
	   		} else {
		   		forward = new ActionForward();
		   		String resAdViewNum=request.getParameter("rnum");
		   		
		   		
		   		ResAdViewProService resAdViewProService = new ResAdViewProService();	   		
		   		ResBean resAdView = resAdViewProService.getResAdView(resAdViewNum);
		   		System.out.println("resAdViewProAction에 resAdViewNum 빈 가져오기 완료");
		   		request.setAttribute("resAdView", resAdView);
		   	   	request.setAttribute("nowPage", nowPage);
		   		forward.setPath("/view/res/resAdViewPro.jsp");
		   		}
		   		return forward;
		}
	}
