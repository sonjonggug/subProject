package notice.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.bean.NoticePageInfo;
import notice.service.NoticeListService;

 public class NoticeAdListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
			
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		ActionForward forward = null;
	   		
		  	int page=1;
			int limit=5;
			
			if(request.getParameter("page")!=null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
	   		if(id==null){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
				out.println("alert('로그인 해주시기 바랍니다.')");
				out.println("location.href='./admin.me';");
		   		out.println("</script>"); 
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
				out.println("alert('관리자가 아닙니다.')");
				out.println("location.href='./admin.me';");
		   		out.println("</script>"); 
	   		}else{
	   		forward = new ActionForward();
			ArrayList<NoticeBean> articleList=new ArrayList<NoticeBean>();
		NoticeListService noticeListService = new NoticeListService();
		int listCount=noticeListService.getListCount(); //총 리스트 수를 받아옴.
		articleList = noticeListService.getArticleList(page,limit); //리스트를 받아옴.
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit/2+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
	        int endPage = startPage+5-1;

		if (endPage> maxPage) endPage= maxPage;

   		NoticePageInfo pageInfo = new NoticePageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
   		forward.setPath("/view/notice/noticeAdList.jsp");
	   }
		return forward;
	 }	 

 }