package res.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import res.bean.ResBean;
import res.service.ResAdUpdateService;

public class ResAdUpdateAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
           
		ActionForward forward = null;
		boolean isModifySuccess = false;
		ResBean article=new ResBean();
		int num=Integer.parseInt(request.getParameter("rnum"));
   		String nowPage = request.getParameter("page");
		    System.out.println(article);
		    System.out.println(num);
		    System.out.println(Integer.parseInt(request.getParameter("rnum")));
		    System.out.println(request.getParameter("rid"));
		    System.out.println(request.getParameter("rcode"));
		    System.out.println(request.getParameter("rstart"));
		    System.out.println(request.getParameter("rend"));
		    System.out.println(request.getParameter("rcancel"));
		    
		    ResAdUpdateService resAdUpdateService = new ResAdUpdateService();
		   
		    article.setRnum(Integer.parseInt(request.getParameter("rnum")));
			article.setRid(request.getParameter("rid"));
			article.setRcode(request.getParameter("rcode"));
			article.setRstart(request.getParameter("rstart"));
			article.setRend(request.getParameter("rend"));
			article.setRcancel(request.getParameter("rcancel"));
			
			isModifySuccess = resAdUpdateService.modifyArticle(article);
			System.out.print("수정 Action > 수정 Service:  ");
			System.out.println(isModifySuccess);
			
			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				System.out.println("수정 실패");
				out.println("history.back()");
				out.println("</script>");
			
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				System.out.println("rnum은 " + num + "현재 페이지는 " + nowPage);
				forward.setPath("./resAdViewAction.re?rnum=" + num + "&page=" + nowPage);
				}
				return forward;
		}
	
	}