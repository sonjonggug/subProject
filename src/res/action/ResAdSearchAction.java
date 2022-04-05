package res.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import res.bean.PageInfo;
import res.bean.ResBean;
import res.service.ResAdSearchListService;
import res.service.ResAdSearchService;


public class ResAdSearchAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	
		 	HttpSession session=request.getSession();
		 	String id=(String)session.getAttribute("id");
	   		ResAdSearchService resAdSearchService = new ResAdSearchService();
	   		ActionForward forward = null;
	   		
		 	int page=1;
			int limit=10;
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			System.out.println("page 번호는 = " + page);
	   		
	 		
	   		if(id==null){
				response.setContentType("text/html;charset=UTF-8");
		   		PrintWriter out = response.getWriter();
				out.println("<script>");
		   		out.println("location.href='/mycar/admin.me'");
		   		out.println("</script>");
	   		
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("location.href='/mycar/admin.me'");
		   		out.println("</script>");
	   		
	   		} else {
			   	forward = new ActionForward();
			   	ArrayList<ResBean> resList=new ArrayList<ResBean>();
			   	ResAdSearchListService resAdSearchListService = new ResAdSearchListService();
			   	
			   	String viewId=request.getParameter("id");
			   	String fieldName = request.getParameter("fieldName");
			   	
				if(request.getParameter("page")!=null){
					page=Integer.parseInt(request.getParameter("page"));
				}// page 값이 있으면
				if(fieldName== null && viewId==null) {
					fieldName = "All";
					viewId = "";
				}
		   		
				int listCount = resAdSearchListService.getresAdListCount(fieldName,viewId); //총 리스트 수를 받아옴.
				System.out.println((int)listCount);
				resList = resAdSearchListService.getResList(page,limit,fieldName,viewId); //리스트를 받아옴.
				//총 페이지 수.
		  		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
		  		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		  		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 5 + 1;
		  		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		  	        int endPage = startPage+10-1;
		
		  		if (endPage > maxPage) endPage = maxPage;
		  		
		  		PageInfo pageInfo = new PageInfo();
		   		pageInfo.setFieldName(fieldName);
		   		pageInfo.setviewId(viewId);
		  		pageInfo.setEndPage(endPage);
		  		pageInfo.setListCount(listCount);
				pageInfo.setMaxPage(maxPage);
				pageInfo.setPage(page);
				pageInfo.setStartPage(startPage);	
				request.setAttribute("id", viewId);	
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("resList", resList);	
		  		forward.setPath("/view/res/resAdList.jsp");
			 }
			return forward;
		}
}