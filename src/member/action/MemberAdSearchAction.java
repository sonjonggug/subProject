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
import member.service.BoardListService2;


public class MemberAdSearchAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	
		 	HttpSession session=request.getSession();
		 	String id=(String)session.getAttribute("id");
		 	int page=1;
			int limit=10;
			ActionForward forward = null;
			forward = new ActionForward();
			String fieldName = request.getParameter("fieldName");
	   		String viewId=request.getParameter("id");
	   		if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}// page 값이 있으면
			if(fieldName== null && viewId==null) {
				fieldName = "All";
				viewId = "";
			}
			request.setCharacterEncoding("UTF-8");
			
	   			if(id==null){
	   			forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./memberLogin.me");
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('d');");
		   		out.println("location.href='./memberLogin.me';");
		   		out.println("</script>");
	   		 }else if(viewId.equals("")){
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
	 	   	return forward;
	 	   		
	   		}else {
	   		
		 	
	   		
	   		ArrayList<MemberBean> articleList=new ArrayList<MemberBean>();
	   		BoardListService2 boardListService2 = new BoardListService2();
	   		
	   		 
	   		
	   		
	   		
	   		//MemberAdSearchService memberAdSearchService = new MemberAdSearchService();
	   		//ArrayList<MemberBean> member1=memberAdSearchService.getMember(viewId);
   		
	   		//MemberBean member=memberAdSearchService.getMember(viewId);
	   		//request.setAttribute("member1", member1);
	   		
	   		int listCount=boardListService2.getListCount1(fieldName,viewId); 
			articleList = boardListService2.getArticleList1(page,limit,fieldName,viewId);
			
	   		int maxPage=(int)((double)listCount/limit+0.95); 
	   		
	   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	   		
	   	        int endPage = startPage+10-1;

	   		if (endPage> maxPage) endPage= maxPage;

	   		PageInfo pageInfo = new PageInfo();
	   		pageInfo.setFieldName(fieldName);
	   		pageInfo.setviewId(viewId);
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("articleList", articleList);
	   		//forward.setPath("./member_info.jsp");
	   		//forward.setPath("./memberAdInfo.jsp");
	   		//forward.setPath("/view/member/memberAdSearch.jsp");
	   		forward.setPath("/view/member/memberAdList.jsp");
	   		//}
	   		
	}return forward;
}}