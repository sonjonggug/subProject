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
import notice.service.NoticeListSearchService;

 public class NoticeAdSearchAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	HttpSession session=request.getSession();
	   		String id=(String)session.getAttribute("id");
	   		int page=1;
	   		int limit=5;
	   		ActionForward forward = null;
			request.setCharacterEncoding("UTF-8");


	   		if(id==null){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
				out.println("alert('濡쒓렇�씤 �빐二쇱떆湲� 諛붾엻�땲�떎.')");
				out.println("location.href='./admin.me';");
		   		out.println("</script>"); 
	   		}else if(!id.equals("admin")){
	   			response.setContentType("text/html;charset=utf8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
				out.println("alert('愿�由ъ옄媛� �븘�떃�땲�떎.')");
				out.println("location.href='./admin.me';");
		   		out.println("</script>"); 
   		}else{
		String noticeSearch = request.getParameter("noticeSearch");

   		if(request.getParameter("page")!=null){
		page=Integer.parseInt(request.getParameter("page"));
   		}
		NoticeListSearchService noticeListSearchService = new NoticeListSearchService();
   		ArrayList<NoticeBean> articleList2=noticeListSearchService.getSearchList(noticeSearch, page, limit);
		int listCount=noticeListSearchService.searchListCount(noticeSearch); //珥� 由ъ뒪�듃 �닔瑜� 諛쏆븘�샂.
		//由ъ뒪�듃瑜� 諛쏆븘�샂.
		//珥� �럹�씠吏� �닔.
   		int maxPage=(int)((double)listCount/limit/2+0.95); //0.95瑜� �뜑�빐�꽌 �삱由� 泥섎━.
   		//�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� �떆�옉 �럹�씠吏� �닔(1, 11, 21 �벑...)
   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
   		//�쁽�옱 �럹�씠吏��뿉 蹂댁뿬以� 留덉�留� �럹�씠吏� �닔.(10, 20, 30 �벑...)
	        int endPage = startPage+5-1;

		if (endPage> maxPage) endPage= maxPage;

   		NoticePageInfo pageInfo = new NoticePageInfo();
   		pageInfo.setNoticeSearch(noticeSearch);
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
   		request.setAttribute("articleList2", articleList2);
		forward = new ActionForward();
   		forward.setPath("/view/notice/noticeAdSearch.jsp");
   		}
   		return forward;
   		
	 }
	 
 }