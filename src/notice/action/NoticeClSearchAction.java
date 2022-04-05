package notice.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.Action;
import main.ActionForward;
import notice.bean.NoticeBean;
import notice.bean.NoticePageInfo;
import notice.service.NoticeListSearchService;

 public class NoticeClSearchAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
	  	int page=1;
		int limit=5;
		

		String noticeSearch = request.getParameter("noticeSearch");
   		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		NoticeListSearchService noticeListSearchService = new NoticeListSearchService();
   		ArrayList<NoticeBean> articleList2=noticeListSearchService.getSearchList(noticeSearch, page, limit);
		int listCount=noticeListSearchService.searchListCount(noticeSearch); //총 리스트 수를 받아옴.
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit/2+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 5 + 0.9)) - 1) * 5 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
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
		ActionForward forward= new ActionForward();
   		forward.setPath("/view/notice/noticeClSearch.jsp");
   		return forward;
   		
	 }
	 
 }