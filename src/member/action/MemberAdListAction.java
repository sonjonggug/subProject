package member.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import member.bean.MemberBean;
import member.bean.PageInfo;
import member.service.BoardListService;
import member.service.MemberAdListService;

public class MemberAdListAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		ActionForward forward = null;
	   		int page=1;
			int limit=10;
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));}		
	   		
	   		if(id==null){
	   			forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./memberAdLogin.me");
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('관리자가 아닙니다.');");
		   		out.println("location.href='./memberAdLogin.jsp';");
		   		out.println("</script>"); 
		   	
	   		}
	   		else{
	   		 forward = new ActionForward();
	   		ArrayList<MemberBean> articleList=new ArrayList<MemberBean>();
	   		BoardListService boardListService = new BoardListService();
	   		
	   	
	   		
	   		int listCount=boardListService.getListCount(); 
			articleList = boardListService.getArticleList(page,limit);
			
	   		int maxPage=(int)((double)listCount/limit+0.95); 
	   		
	   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
	   		
	   	        int endPage = startPage+5-1;

	   		if (endPage> maxPage) endPage= maxPage;

	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
	   		
	   		forward.setPath("/view/member/memberAdList.jsp");
	   		//forward.setPath("./zzz.jsp");
	   		}
	   		return forward;
	}
}